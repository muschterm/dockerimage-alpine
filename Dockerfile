ARG build_version=3.14.1
FROM alpine:${build_version}
LABEL maintainer "Matthew Muschter <muschterm@linux.com>"

RUN apk add --no-cache \
        "su-exec" \
        "sudo" \
        "curl" \
        "git" \
        "zsh" \
        "openssh-client" \
        "jq"; \
    rm -rf ~/.cache; \
    chmod 755 /etc/sudoers.d; \
# --add-dotfiles------------------------------------
    git clone https://github.com/muschterm/dotfiles.git -b main; \
    mkdir "/opt/dotfiles"; \
    mv "dotfiles/init" "/opt/dotfiles/"; \
    mv "dotfiles/scripts" "/opt/dotfiles/"; \
    mv "dotfiles/docker-scripts" "/opt/dotfiles/"; \
    mv "dotfiles/bin/docker-build" "/usr/local/bin/"; \
    mv "dotfiles/bin/print-arch" "/usr/local/bin/"; \
    mv "dotfiles/bin/print-distro" "/usr/local/bin/"; \
    rm -rf dotfiles; \
    chmod 644 /opt/dotfiles/init; \
    printf -- "\n. /opt/dotfiles/init\n" >> "/etc/zsh/zshrc"; \
    chmod 755 /opt/dotfiles/scripts/*; \
    chmod 755 /opt/dotfiles/docker-scripts/*; \
    chmod 755 /usr/local/bin/docker-build; \
    chmod 755 /usr/local/bin/print-arch; \
    chmod 755 /usr/local/bin/print-distro;
# --add-dotfiles------------------------------------

ENTRYPOINT [ "/opt/dotfiles/docker-scripts/docker-entrypoint.sh" ]
CMD [ "/bin/zsh", "--login" ]
