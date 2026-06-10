Return-Path: <linux-doc+bounces-91884-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 43tgBq3oKWrmfQMAu9opvQ
	(envelope-from <linux-doc+bounces-91884-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:43:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DB66D3C0
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:43:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GCDhfGUX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91884-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91884-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 345683124C20
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 22:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DFA37AA79;
	Wed, 10 Jun 2026 22:43:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D536A023
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 22:43:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131406; cv=none; b=jQprPQZHXQFJ79FqlICGBXzw1NBZ9HGLBqRjQHhiLeOjUVUtVcdbgS6fUzxPApx8M+/zzd4h8roXV/xnV1VSXoNohGVWEhceW4izaZI0yFrRyo6jlKXLwiFEPGWXy2NOB2G7CXoGHolec1wRBRG2b1TTFTebZbPEaTQJfOlmCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131406; c=relaxed/simple;
	bh=0mIimJZwSrMOwOod1z2uAYi8SE+ZraOi6XHfdAjx1Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c81O4qpMUrqQN0oHaKGnBlAfJlf+LcGR7Hz8pq7KZDIFWdJGcIWDTZeKmgpnw11IUuOyTJpAN/RQ0gXDcl1V6WHvNhSDdzc+bhJuM/eyLhS54H9sE2BEdsEY5ucaS/Cx/RG+pAYSfpvEpfT0sdLs/pUWGQMPl8+algo4Yp7lYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCDhfGUX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA541F0089B
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131404;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GCDhfGUXvvVNHLXhr3frkjO1Rp4OtsKp0qM3R31fePjb//IULavexvDmNUUwA04Ub
	 Dzlzh2pzRTGy59f+l+FcFl6Yb7JHo1erepIH9ag8J/kku0Cip94/n/lnMR10AXod+E
	 Eo9yh0/1Iz8nn2Z2avr7KPAgjzoa5BEPnlspQTzlg3rKjx1wz7yacqY5QAT1hJvXmc
	 p+h4mmaqYQXlAywwxh+PM6aAWHmctdeOpMdFSOJmYCYFWVtcq+mLZQz8SbOiIU5i+B
	 W6h3yZfiZGrVAGQ4KxdyXBJ5+NYJjpIS11ozMi8kHTJQg+Iz/vEkAJtdxm8C+VNjjZ
	 1YzD783Gy0FgA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so4266548a12.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 15:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lZlXfw41qWCYK2RtNJ/En8XY5FMX+DN5I1bVF6dlM+cWJSKzb3wBzu9YxYqTFTMUt3hJvpTbApcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQaEJktSEferGprXlsJZK+ZTge2CvW2Ntvk8Ms2t8caD0wkgs
	dI2UnLaMrh5Z2PVQPHxlS2dQXBrEnYIcMNCMABFuPJ7+6GZZwXT7uMQ7Qmb0B68Bn7QD71WWL6E
	uPnOHnEH4osbsQmm9EtO/ZUqGc62t7g==
X-Received: by 2002:a17:907:c28c:b0:bd0:df77:98bb with SMTP id
 a640c23a62f3a-bf3702817fbmr1479114866b.9.1781131402612; Wed, 10 Jun 2026
 15:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609151212.29469-1-ansuelsmth@gmail.com> <20260609151212.29469-9-ansuelsmth@gmail.com>
In-Reply-To: <20260609151212.29469-9-ansuelsmth@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jun 2026 17:43:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
X-Gm-Features: AVVi8CfnalHGFSDJtFBoMIJ88H-i-Yw1YCOHz7GBxBm4GdczRrsSV4xJzXraBNE
Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support
 for "pcs-handle"
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91884-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ansuelsmth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:lorenzo@kernel.org,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:p.zabel@pengutronix.de,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:llvm@lists.linux.dev,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,armlinux.org.uk,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev,dt,lkml];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A04DB66D3C0

On Tue, Jun 9, 2026 at 10:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for parsing PCS binding so that fw_devlink can
> enforce the dependency with Ethernet port.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746..e6584a2f705d 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-cont=
rollers", "#access-controller
>  DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")

There is no such common property "#pcs-cells".

>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_interrupts, },
>         { .parse_prop =3D parse_interrupt_map, },
>         { .parse_prop =3D parse_access_controllers, },
> +       { .parse_prop =3D parse_pcs_handle, },
>         { .parse_prop =3D parse_regulators, },
>         { .parse_prop =3D parse_gpio, },
>         { .parse_prop =3D parse_gpios, },
> --
> 2.53.0
>

