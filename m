Return-Path: <linux-doc+bounces-91378-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BTj8JxrRJmoolAIAu9opvQ
	(envelope-from <linux-doc+bounces-91378-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 16:26:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2F657280
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 16:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Zk9cYkxB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91378-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91378-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16E07300BE9F
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952413C342D;
	Mon,  8 Jun 2026 14:14:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5913C3458
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 14:14:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928071; cv=none; b=IdzF9d29NVWwaB9831yMIHyOXp1BcUfkc4Zp1TJ9X/VF/kGP183yNYot6Xc17dYNUo2V1uHqCizveL89zyI9kzl0LGvKcjKjUBfGIW83yO/2bzW5Jx+y+GzjecVg/gHlrKR+yp/EA03xyAHScouVwU6y21ER9NVL1OUL3zDphAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928071; c=relaxed/simple;
	bh=zRcq7hvyLegS8gubbI3IaDtmwEY+Vg4sFbx9Irv/Nu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAOB5O3JqtC+1NPOFaQBje7i2aSpMhKVvWBFeOWZuJBgXYgZ5+pDhXR5yUXLO5909T+vjTqHG1mZ4qFs+MA+MurfYz01k88RZQfpYFdKQDUHKq/Pa/z2k8N1579ixQLXKXl3Bm77Ibq6uzcuuzSbdqQNVvAFKwky/y5L05lC+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk9cYkxB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27A01F0089A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928069;
	bh=eSxueWI97Nd0HIpXZt2/6f6Cki2E4ALmqRIprvf5YLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zk9cYkxBcO71I4LidvWB7fMyclBW9xiEelnlUrxNbs0LCD6Sms6GgrFNPevTFZK7X
	 wZXmLpxb6hCNqq+5uQ+eWFPnJvgrlg9IxNeK2upGy3+IdtKtQ1jVK9L2jYeMPbSlk/
	 XxbZ31/4fX+MjDOpfJy9PBfrVU45UZJMYuWHTq7bq7eaAhNPRLSnwMs6iOnvOONyfh
	 +K7CTriYvhV+v/s5LijfxX5HjutjPInB7Xe6X/hhBq//tKfwUQweKBi9pUXIwaAN9n
	 qJjs6Yxag21YO0apM+43aNlqWt8SUbj1bDsHtsIdaZLOqWV7F9ajTWtRuYqwzqlev/
	 FSFRNHOKuGRKw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39677242021so43174051fa.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 07:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8DO1NFUkjGgtWJBPIRgxnFryBWbux5t49KTdmGzGHKiPzj/KJBMt1eDOHB96jdXNsQK2GS9q7CupU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgal5u04kbVsSxPDyCnhVgQMicQYsgHyGe1T3Czim3sMmdRSEQ
	JuwUIUO6nSW1ejjP8OAHoQBTQ+G47WNRvIhZ0bcwG5E70MmsXJD6zZGSUt0rh2S1V2KjJ3VOoJ4
	jnOZJc3fKhRdaMY5Z8V+q8+89M1dGPvU=
X-Received: by 2002:a05:6512:61d9:10b0:5aa:75f2:c996 with SMTP id
 2adb3069b0e04-5aa87bb9a8emr2925826e87.16.1780928068164; Mon, 08 Jun 2026
 07:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-3-tzungbi@kernel.org>
In-Reply-To: <20260608021526.1023248-3-tzungbi@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 16:14:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g4VuR20dF+Zw0b75u4=ajFBOBAKokCoyDBtjCETexK3Q@mail.gmail.com>
X-Gm-Features: AVVi8Cf-yVtB-_ZCMWb6LiTND9zpInaCLbDQLFNJYhfYmpIjcvNfGhmHn4CDvJA
Message-ID: <CAJZ5v0g4VuR20dF+Zw0b75u4=ajFBOBAKokCoyDBtjCETexK3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] PM: dpm_watchdog: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, tfiga@chromium.org, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91378-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FB2F657280

On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Introduce the CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED Kconfig option to
> allow the device suspend/resume watchdog (DPM watchdog) to be disabled
> by default at compile time.
>
> Additionally, introduce the "dpm_watchdog_enabled" module parameter to
> allow the watchdog to be enabled or disabled at boot time (via
> "power.dpm_watchdog_enabled") and at runtime (via sysfs).

I think that the new module param is more important because the new
config option is just its default value, so I'd rearrange the
changelog.

Also, I think that the "DEFAULT_" part of the new config option name
doesn't provide any additional value, so I'd just drop it.

> This provides flexibility for systems that want the watchdog code
> compiled in but inactive by default, allowing it to be enabled only when
> needed.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v3:
> - Add "PM" tag (was missing).
> - Update the format and specify dependencies in kernel-parameters.txt.
> - Update the help message in Kconfig to reflect that dpm_watchdog_enabled
>   can be set at runtime as well.
>
> v2: https://lore.kernel.org/all/20260604090756.2884671-3-tzungbi@kernel.o=
rg
> - Use module parameter and bool for dpm_watchdog_enabled.
> - Use IS_ENABLED().
>
> v1: https://lore.kernel.org/all/20260528103215.505795-1-tzungbi@kernel.or=
g
>
>  Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
>  drivers/base/power/main.c                       | 11 +++++++++++
>  kernel/power/Kconfig                            | 10 ++++++++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 00375193bd26..f2620764c28e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -47,6 +47,7 @@
>         PCI     PCI bus support is enabled.
>         PCIE    PCI Express support is enabled.
>         PCMCIA  The PCMCIA subsystem is enabled.
> +       PM      Power Management support is enabled.
>         PNP     Plug & Play support is enabled.
>         PPC     PowerPC architecture is enabled.
>         PPT     Parallel port support is enabled.
> @@ -5399,6 +5400,13 @@ Kernel parameters
>                         function to NULL. On Idle the CPU just reduces
>                         execution priority.
>
> +       power.dpm_watchdog_enabled=3D
> +                       [PM] Enable or disable the device suspend/resume
> +                       watchdog (DPM watchdog).  Requires CONFIG_PM_SLEE=
P and
> +                       CONFIG_DPM_WATCHDOG enabled.
> +                       Format: <bool>
> +                       Default value is set by CONFIG_DPM_WATCHDOG_DEFAU=
LT_ENABLED.
> +
>         ppc_strict_facility_enable
>                         [PPC,ENABLE] This option catches any kernel float=
ing point,
>                         Altivec, VSX and SPE outside of regions specifica=
lly
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index cd864f3a2799..7822c29b7c8d 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -534,6 +534,11 @@ module_param(dpm_watchdog_all_cpu_backtrace, bool, 0=
644);
>  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
>                  "Backtrace all CPUs on DPM watchdog timeout");
>
> +static bool __read_mostly dpm_watchdog_enabled =3D
> +                               IS_ENABLED(CONFIG_DPM_WATCHDOG_DEFAULT_EN=
ABLED);
> +module_param(dpm_watchdog_enabled, bool, 0644);
> +MODULE_PARM_DESC(dpm_watchdog_enabled, "Enable DPM watchdog");
> +
>  /**
>   * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
>   * @t: The timer that PM watchdog depends on.
> @@ -577,6 +582,9 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd,=
 struct device *dev)
>  {
>         struct timer_list *timer =3D &wd->timer;
>
> +       if (!dpm_watchdog_enabled)
> +               return;
> +
>         wd->dev =3D dev;
>         wd->tsk =3D current;
>         wd->fatal =3D CONFIG_DPM_WATCHDOG_TIMEOUT =3D=3D CONFIG_DPM_WATCH=
DOG_WARNING_TIMEOUT;
> @@ -595,6 +603,9 @@ static void dpm_watchdog_clear(struct dpm_watchdog *w=
d)
>  {
>         struct timer_list *timer =3D &wd->timer;
>
> +       if (!dpm_watchdog_enabled)
> +               return;
> +
>         timer_delete_sync(timer);
>         timer_destroy_on_stack(timer);
>  }
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 530c897311d4..b16bd159074a 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -268,6 +268,16 @@ config DPM_WATCHDOG
>           captured in pstore device for inspection in subsequent
>           boot session.
>
> +config DPM_WATCHDOG_DEFAULT_ENABLED
> +       bool "Enable DPM watchdog by default"
> +       depends on DPM_WATCHDOG
> +       default y
> +       help
> +         If you say Y here, the DPM watchdog will be enabled by default.
> +         If you say N, it will be compiled in but disabled.  It can be
> +         enabled at boot time via the "power.dpm_watchdog_enabled" kerne=
l
> +         parameter or at runtime via sysfs.
> +
>  config DPM_WATCHDOG_TIMEOUT
>         int "Watchdog timeout to panic in seconds"
>         range 1 120
> --
> 2.54.0.1099.g489fc7bff1-goog
>

