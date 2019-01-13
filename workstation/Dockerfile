FROM archlinux/base:latest as onepassword_build
RUN pacman -Syy && \
    pacman -S unzip --noconfirm
RUN curl -sS -o 1password.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip && \
    unzip 1password.zip op -d /usr/bin && \
    rm 1password.zip

FROM archlinux/base:latest
COPY --from=onepassword_build /usr/bin/op /usr/local/bin/