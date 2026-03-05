Return-Path: <linux-doc+bounces-77970-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFKgKiJ/qWlB9QAAu9opvQ
	(envelope-from <linux-doc+bounces-77970-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 14:03:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F15212546
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 14:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6967F30419E1
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F00539F167;
	Thu,  5 Mar 2026 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUQBtpc4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A93A1A59
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715731; cv=none; b=UkOqbcDxVNv4873Kj7OYa1WmERwFLdL+jqObu0+fJaqUPNcWn0KuiHSxpghzironReVvrfOm2SdxJJ9+XP6YQMgl96qjhOv0Z1fCACeQrS2n0pm/gpTJjbYKHLZLfdMaKSSs7G93c4v8lRgFOTqG9YIwTUHCOQKucTJYqb40PI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715731; c=relaxed/simple;
	bh=Y3PQBbklIoBSVs1Uf2NtADUm7Wrj/63rh2E73LlCo6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmVI+6Aui5I1PGU56oXn4ufLshMrGrU0C2Vg3vOD85kKey+N1iDO26UrAc9z3z1Fzz+9c6OXsquX5vWPMqZ35V8Tr2dQusVT6Ra0pTmoRgN/NC5Z9H/mzgjQuwcSzmdFf/Dv5DMVvqxTzHkp4XtxikT8gDZlQhCMbsb65C6nx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUQBtpc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946CCC2BCB6
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715730;
	bh=Y3PQBbklIoBSVs1Uf2NtADUm7Wrj/63rh2E73LlCo6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gUQBtpc4AVHgDACLeg6f/Qu9tYym9mDpMpfFAt++bfyM4b7g8GNRJN+oKvhUL+ZdN
	 MRXvR/coeidbwzWpGQa0hmjBJ+lBoWzv9Dg6dlMihJs+yNcAlGwvrCYTv+anr1eclw
	 zbFWvqiyXYHn3klxyHm3xLT9yita5t6r8Dnx4kCEjswvK9Rx+aRT36oVBkPtEDMMp/
	 12JeEQgqYRN+wGdx8Ih5PijNfVQtqi4NLPI/kCqww69uu2Q0MiX22L36Pi+fqEpL62
	 b70kAj3IaF4mb941ZyB0//BtVIJQmIoNh+B1XGXPeFsM+xELi2DoY4LbOz42ha9G5Q
	 gvrfcUTqGCZVA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79801df3e21so73642037b3.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 05:02:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl2SagFmyFKGNL/XyismLAcyVGKNmGP53JtvcJwtvfNmVSnCZblgO6CqC67A3Eukr186keLuG3RSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+0bfoDibvfcq3WCTiMo7Y731dUtrrVjIp95a2NBcwYWRcA/6
	pYD+GOCYt83LotCqXYUWDVPSwyWTo39pEjD0ugQ2ERuhbeHwjPFjCHGMoa7WlJ0WEFc4mREgbrw
	e1JquklbxxTiFqY+opWq/Z68IkDkRVwc=
X-Received: by 2002:a05:690c:f09:b0:794:dac2:89de with SMTP id
 00721157ae682-798c6be38f0mr48176717b3.17.1772715729820; Thu, 05 Mar 2026
 05:02:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-6-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-6-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 14:01:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=cZ59F1X6Yz_9cOvBLq+Vc4_OZWN+tTUqpStS5PXbV7w@mail.gmail.com>
X-Gm-Features: AaiRm528EaLwv_KXrf5uesPMaGbWTVKCJzU5xf6797RKygLsnD1f1zGkjbql-ms
Message-ID: <CAD++jL=cZ59F1X6Yz_9cOvBLq+Vc4_OZWN+tTUqpStS5PXbV7w@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: sim: allow to define the active-low setting of
 a simulated hog
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A9F15212546
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77970-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Add a new configfs attribute to the hog group allowing to configure the
> active-low lookup flag for hogged lines.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If you add an explanation to why this is needed (I can think
of a few) then:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

