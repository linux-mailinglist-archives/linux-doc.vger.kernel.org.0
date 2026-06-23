Return-Path: <linux-doc+bounces-93303-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cAhPMLLaOmrRIggAu9opvQ
	(envelope-from <linux-doc+bounces-93303-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 21:12:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B86B99AB
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 21:12:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amacapital-net.20251104.gappssmtp.com header.s=20251104 header.b=muhNy7DX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93303-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93303-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13559307E1AD
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 19:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643DB3803C7;
	Tue, 23 Jun 2026 19:12:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DE937F8A0
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 19:12:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241960; cv=pass; b=bjrGOgc0mdJubjF5exTDgAVfBK3UgfABTcRSD5mltC6PuUYSdbx9IRVtTQ7zv5af4HRi7UECZzZ8YOA7zaeXdCm8LlmFNme9r9eKpLa68TfFLEPQYJeJv5hjempMinm6WcMCPMQOF7xSOyO0NI0o4TAcUebLjvjK6q1GZXsnMKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241960; c=relaxed/simple;
	bh=ii6MvtTjLi70cljzH6vlCK19qdEyYEgO4Rik7cd/sMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBpfWXp00AZ7NTBbW1tp/dEHdrA0HN8XpkFtlXZ/KB42GEW6E9V/rq0g32PctXQ1BzGVkZ+9DoYwiyZJudt+cpbd9tQ4IVpiEV8Nqiysd9jn59iZ5it5L4VwrIf8ZqPERUSVwsZA9AedDNcGVI9L6cCg20KaVfRA9zeVQvzA89E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=muhNy7DX; arc=pass smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so188770e87.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 12:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782241957; cv=none;
        d=google.com; s=arc-20240605;
        b=UQ6eTswtPSPFCIC4d/2vkSxeoeJwe3Ndmt4H3y0SXR8O9iq8/63hckxbBAuKZL/i9v
         sbN5USgXs8ANEGrXxnByjBLe6iTqJAfQM/oWNL+FdciMWAq1zkY1CUaH86NarEu1cwTW
         QijFT95rJfPcesWHfDmyhjFKy1xkOiyDLkTGVQq8D4rPZHwl3OpTkZrk2wxeTPM1w0wM
         73zIyULmZOivy0IdvWSDVmnHf2+5nliVEQWeEgdV2Hba+6CCYRgQF6w4TWb7oyOMWcze
         uOhGEAT3UxiIIPewOkzHxV1VqowcP6QImxV3+0LEFZnvn8/6Ra0XyEa5EDgEfVSCAxnE
         WEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/vvDwAJenwF6coS01e9xCYrLEyTAVwYfnUT70JedLS0=;
        fh=b5+b89sF0R580fNe4LOFAy8wak7DQzIaHeYiu5w3KD0=;
        b=FSpzW0YG78q/+B76Nr8f1tVnB9gatJzibB5MebRx+ZhjkML4Dz2C9qQkGmUrJV8fYk
         YhUgNpUjyQ7bzooF3BLF04/JkAtmICXpV4xS5Eja/hHoKO0/3XjqCBjKcwmYMFcQJtMU
         AzVA43nipGm/QaWoH5dQP0d878qAPpbnSiyz9mWZcnYvsWbh6GDjfbyQM0qNTb0HLuhh
         K0whVgaMc9/+zquZ6f3ZlbA8c5viR1O+C0Jcfeqg2zj+s5iaarENtkG7BbJuKOLUMlAo
         17Nqx7HJIM/qJRw0q3Wu+l1zlR2QomojJ4PEx6LqXcv9uqlnieYxFmzqMEA7LlZXmCbo
         y3VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1782241957; x=1782846757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vvDwAJenwF6coS01e9xCYrLEyTAVwYfnUT70JedLS0=;
        b=muhNy7DXA2jhxWRc7VjyBLC2W5K+vsw6ky4fhELzH5+mRCNYrMENNAMsiac1FFAwAN
         5Y7j8e33TdHsCW22GLfJnZxalkzwM7GZWN02MUoYYDLU91tQ91K3wGjQo9RiX+9NN9Ls
         al2Xadtgum6dohsjBdSHYFJm99lajb9XcLcpmLnhl+4ZzLY7YoDqjg+6+Z56p/czMQxo
         5DzqbALLVqR3t38rJOEeC+XAe6FvKLOnedaTm2N69vu+ZPlWy6eznEgmzxQP1DLGzai2
         lh4LkfW5orbRHtlQc57Hs7Y4xakKRD9UQaDbbmG4cuuSZ+WUomrh1AJkUW+YJZSrzlA/
         x7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241957; x=1782846757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/vvDwAJenwF6coS01e9xCYrLEyTAVwYfnUT70JedLS0=;
        b=Psbeyx8xGTOaHKlVen1oUT0oaNDJ8/PTxykO8gy0Pe4ZMCOfuc0ioXp7sJBhR5G7JE
         mrt09R49zPOONV4CjJ98Mmw8PAbLUstLlZBGKu6sZaY5U7N2N6zSiASUbp+z4cRh+yqL
         x4ef6p2j5N70SDAePsDXTAefkdF7MBsgQk/5R2Wgh5/6LClJzshTN6Umpoy124jsaS+d
         HPhO74uwptL5VpGmSV2N0IJo7ZFY808ozUdbxJFDkOSzoz3Z6NKK/Ucno+phIPJqoyAc
         kxd1WvxRDdVlNbs2kERguBq4tCgmiw5nkFHNM8+EHXc43n0vnDP7NUz5JOhsBTyogiBk
         kARA==
X-Forwarded-Encrypted: i=1; AFNElJ+W1U+e2oxuTqm6IEqfPRlAhOpRGNtuKRtxHNJDAfBj9DPrEVq0B8AGtIMnT4GOlajYaLLP9dAi5Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBuFzUfQhaO8RnO9+Du5RlcqD3BFp3BvrFQ4VWd2Hr8OGiTrpv
	fVDpxn+FuYOwoPO+zRxwK6rywxqpgfbSpPzy7Vf4hGzI4qIBrQkqU+ppjQIVf+JVcDRqXgpMcmg
	IhFkzq6+a24/LV8AmHPVJHFFP0/kEDnCu0Xdhsyaq
X-Gm-Gg: AfdE7ckdYJ5Oz+JCMDseXcQuPxr2EgaHGA7kOLIAqJWtzFaHDgc1TthCGSh6FIJnk8j
	3eAom8VvMLui0Ayf2CybiCpCvF7/fJ/nQRTYQAxmINDO49d5YSLrKAf+VZv6RUA7j20lRhcBrK2
	gHjnDeHhgaxnjcG8rlxn3NkINwDIGDd9EzQjm8hAhMFctIfjPn0ae0TVoWu6kbOqse8bfKIymsz
	FYjro1WpO8Cau6d18iOiMmkCSZv5T6ut6Qj1Ltwuzv6bZT8jUMCzH8SLnVkHjEvSFS2RLVB
X-Received: by 2002:ac2:44d4:0:b0:5aa:8822:b874 with SMTP id
 2adb3069b0e04-5ad5771ec41mr4233175e87.46.1782241957214; Tue, 23 Jun 2026
 12:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622234803.6982-1-ebiggers@kernel.org>
In-Reply-To: <20260622234803.6982-1-ebiggers@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 23 Jun 2026 12:12:24 -0700
X-Gm-Features: AVVi8CdurCE0Z4nmJzTanxEgxUT-VwvR4nCHq2kkCJY0BXv2CrDitgelAGd8YoA
Message-ID: <CALCETrXPj0u=FZ=aFcZAHk3fFZa7rCuPEjx6cOMXmT3sdkC7SA@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Add af_alg_restrict sysctl, defaulting
 to 1
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, iwd@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Milan Broz <gmazyland@gmail.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amacapital-net.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93303-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:iwd@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:gmazyland@gmail.com,m:demiobenour@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[amacapital.net];
	FORGED_SENDER(0.00)[luto@amacapital.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gondor.apana.org.au,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luto@amacapital.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[amacapital-net.20251104.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amacapital.net:from_mime,vger.kernel.org:from_smtp,mail.gmail.com:mid,amacapital-net.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 617B86B99AB

On Mon, Jun 22, 2026 at 4:49=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> AF_ALG is a frequent source of vulnerabilities and a maintenance
> nightmare.  It exposes far more functionality to userspace than ever
> should have been exposed, especially to unprivileged processes.  Recent
> exploits have targeted kernel internal implementation details like
> "authencesn" that have zero use case for userspace access.
>
> Fortunately, AF_ALG is rarely used in practice, as userspace crypto
> libraries exist.  And when it is used, only some functionality is known
> to be used, and many users are known to hold capabilities already.
> iwd for example requires CAP_NET_ADMIN and has a known algorithm list
> (https://lore.kernel.org/linux-crypto/bcbbef00-5881-421b-8892-7be6c04b832=
d@gmail.com/).
>
> Thus, let's restrict the set of allowed algorithms by default, depending
> on the capabilities held.
>
> Add a sysctl /proc/sys/crypto/af_alg_restrict with meaning:
>
>     0: unrestricted
>     1: limited functionality
>     2: completely disabled
>
> Set the default value to 1, which enables an algorithm allowlist for
> unprivileged processes and a slightly longer allowlist for privileged
> processes.

In our brave new world of containers, this is a bit awkward.  The
admin is sort of asking two separate questions:

1. Is the actual running distro and its privileged components capable
of working without AF_ALG or with only the parts marked as being
unprivileged?

2. Is the system running contains that need the unprivileged parts?
(Which is maybe just sha1 for ip?  I really don't know.)

Should there maybe be two separate options so that all options are
available?  Or maybe something between 2 and 3 that means "limited
functionality and privileged modes are completely disabled"?

