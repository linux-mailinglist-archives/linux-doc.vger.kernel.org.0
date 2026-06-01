Return-Path: <linux-doc+bounces-90374-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLKZOQPSHWpMfAkAu9opvQ
	(envelope-from <linux-doc+bounces-90374-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:40:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C03624228
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9A93017098
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC96A3E8332;
	Mon,  1 Jun 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG1taH52"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44743EF0A1
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339199; cv=none; b=tSq/HtAvXzT2cPAcxUhyXJwO2xxDDZxXzerfaFLu8+WI6dBh1bhxQ5osJ9wLTgU+wBiOPJH+Wxnye6rAYCWP8Q6wKE/VtUzAdtiDwa9JL6ORfQ4SIgd5B0l+gkUfyVzCV/1cQmeoaZyrmadoJekWUWOVm28UgM7rNJ0PuFpXlBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339199; c=relaxed/simple;
	bh=snnOueHzpddTMr0EOzT/SQMImZLV+bNVpqocozMConY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byciqz2rDeo5NO3x7lxeXla5iQhCrbm8Gk3Tqv9uuOiPx5Io1sbSC9jDmTts0N/Zi7OeDD4wHb7BC4npsafrgms3kfF+YhU9aRPgE2ZPdKEIALb2U4rtxWb1jHgnYxC2LhXEEg43hu4rznY+kiOTw0yLgWMwnvqT3f9MF91itk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG1taH52; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD641F00893
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339195;
	bh=+LmQVnmfAqr309eQQOPVN3BHemABDS73n6a5IHIbBM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EG1taH52XEILSUuPBEv3wY1T3HW01F/Zs+5no/1HQKlXKfvVZBSNCUwuZqgJ4Iaes
	 IWKZUMmDYbqmLN9/Vcis3RMuBFUTIrG3uXrZdwLTSTsS754ukvBomFdjxpENFdY50L
	 gdUVR/ut9s2IJkJ7Ou5hkEi/tqfloHI/b25HLD/mpA73DsM55gHhEOUvUR4PSCsIz2
	 iDmNxhDMMBYnOMYnavySGiaPJCUO4lsnStTjOPU+2FPRSL6HL/NgIghJcpcCZq6oNF
	 R4o/xsBL3y+FqE3D/KPVAEAQVpB0ScvTRIrjqEp8a9KY8G7V+IH/+4ez/HJ8+jKwth
	 mSKlxtTBQ3zfA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so2060170e87.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 11:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+H2kcWlFHl9oBb/OPzzJalNTYLCALGr62lSm4GiSTUuyN1qnmP7Gl+L4WXqHkQNbXQ0AAcH/T1kl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxmTvNUj9SWVNlceyVvREQatNZcJVxosJ3HLzLkuDYOy9LzWkL
	9N5bpcEp0BF6E4QMk89NQJhEj2nTTZ0IyZzzCGHTtLCR7LUdPb+xtKKQC8Ah4cApJhnuJv8OUOv
	e17UKXX9YKzTtwOxyw9fEXaeJVZNIYNg=
X-Received: by 2002:a05:6512:40cd:10b0:5aa:65b1:93ad with SMTP id
 2adb3069b0e04-5aa73ef21b5mr312223e87.35.1780339193786; Mon, 01 Jun 2026
 11:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528103215.505795-1-tzungbi@kernel.org>
In-Reply-To: <20260528103215.505795-1-tzungbi@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Jun 2026 20:39:42 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
X-Gm-Features: AVHnY4L0Ij-nQuMTLjzET6J7p6BaLuxrhCJAKBSFWN5kexmIcrQoC6VSYabDmjY
Message-ID: <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90374-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 91C03624228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Introduce the CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED Kconfig option to
> allow the device suspend/resume watchdog (DPM watchdog) to be disabled
> by default at compile time.
>
> Additionally, introduce the "dpm_watchdog_enabled" boot parameter to
> enable or disable the watchdog at boot time.
>
> This provides flexibility for systems that want the watchdog code
> compiled in but inactive by default, allowing it to be enabled only when
> needed.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../admin-guide/kernel-parameters.txt         |  8 ++++++++
>  drivers/base/power/main.c                     | 20 +++++++++++++++++++
>  kernel/power/Kconfig                          |  9 +++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 85936e48cf9a..3a919e660137 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1344,6 +1344,14 @@ Kernel parameters
>                         it becomes active and is searched during signatur=
e
>                         verification.
>
> +       dpm_watchdog_enabled=3D
> +                       [KNL] Enable or disable the device suspend/resume
> +                       watchdog (DPM watchdog).
> +                       Format: {"0" | "1"}
> +                       0: disable
> +                       1: enable
> +                       Default value is set by CONFIG_DPM_WATCHDOG_DEFAU=
LT_ENABLED.
> +
>         driver_async_probe=3D  [KNL]
>                         List of driver names to be probed asynchronously.=
 *
>                         matches with all driver names. If * is specified,=
 the
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index e1b550664bab..4f92905f3edf 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -527,6 +527,20 @@ module_param(dpm_watchdog_all_cpu_backtrace, bool, 0=
644);
>  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
>                  "Backtrace all CPUs on DPM watchdog timeout");
>
> +#ifdef CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED
> +static unsigned int __read_mostly dpm_watchdog_enabled =3D 1;
> +#else
> +static unsigned int __read_mostly dpm_watchdog_enabled;
> +#endif
> +
> +static int __init dpm_watchdog_setup(char *str)
> +{
> +       if (kstrtouint(str, 0, &dpm_watchdog_enabled) =3D=3D 0)
> +               return 1;
> +       return 0;
> +}
> +__setup("dpm_watchdog_enabled=3D", dpm_watchdog_setup);

You might as well use a module parameter to allow this to be set or
clear at run time.  Is there a particular reason why you only want it
to be enabled or disabled via the kernel command line?

> +
>  /**
>   * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
>   * @t: The timer that PM watchdog depends on.
> @@ -570,6 +584,9 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd,=
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
> @@ -588,6 +605,9 @@ static void dpm_watchdog_clear(struct dpm_watchdog *w=
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
> index 05337f437cca..d4cecdb8575e 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -267,6 +267,15 @@ config DPM_WATCHDOG
>           captured in pstore device for inspection in subsequent
>           boot session.
>
> +config DPM_WATCHDOG_DEFAULT_ENABLED
> +       bool "Enable DPM watchdog by default"
> +       depends on DPM_WATCHDOG
> +       default y
> +       help
> +         If you say Y here, the DPM watchdog will be enabled by default.
> +         If you say N, it will be compiled in but disabled, requiring a
> +         boot parameter to activate.
> +
>  config DPM_WATCHDOG_TIMEOUT
>         int "Watchdog timeout to panic in seconds"
>         range 1 120
> --
> 2.54.0.929.g9b7fa37559-goog
>

