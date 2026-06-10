Return-Path: <linux-doc+bounces-91812-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T3GsAZQvKWpwSAMAu9opvQ
	(envelope-from <linux-doc+bounces-91812-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 11:34:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A8667E26
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 11:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O48KkhDw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91812-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91812-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D62623027C5A
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 09:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1BD3CFF61;
	Wed, 10 Jun 2026 09:34:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BCB3CF205
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 09:34:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084047; cv=pass; b=U9Qm82ceEMLIYJWMBMGpqv7U+COiK6T6rOWp9Dij86uJJFkdFtxwZW4Uvy5H4z/GIbqvGQDmQGsx6+VCM1YKzJdtxo9GMa3COqzIInJy4m8JE3xJRev+WvQE9QYAz4kA4v6oHHelBoyqbK/rkNQGb7/uOv0ovoKu2CDxndBQTBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084047; c=relaxed/simple;
	bh=TEdCx4Ul4BPkVidIQLKMS6KkTXZps8JZ9GJQJ87hLI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7F+Olm6fEsbWSY/RBeoqqzgHhmZZjq+HGPw6G52Dnk4NBq7Qz/4MTx02EQlx1J1n5iFZ8BnYTU/x0/cw/swClpFcHnyBt1FAh6Q0dFP+UNaUPsB2HNKz59yQZLXn9mmkV3Wx9QdtqWYZysaZrOIhSa7adCYn8jtscapeiMN26c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O48KkhDw; arc=pass smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304cf518c9dso8086590eec.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 02:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781084045; cv=none;
        d=google.com; s=arc-20240605;
        b=M3gf2J7LmN8CPHdwPAIdHN7UXlPOFvuRYauHJBbglwwK7DxVCqdvPxVqBBxjEaMPNm
         /BbfgdFn6YszGWTBtANGDhKxmcooh4TAR/DW6MqFRBPA1wRH9PUeiAu7oAajANS+i4YC
         X4DXBFsUgrqwWosyprYuJPgKMczR4kyXeg+KOaUDcsMn80gKVqZbzkBLoi8v5mZ/Soqg
         QVJKgpN8zt+/R3NlUdCMFFQyuPNVj+jBfkFAX57II8JpnhScyWVDHKhg0ZKnryEY0DNc
         YF9+hcb6beK3x/TEFo/oBEZU4a/TJJyuzvQnpj9g55h1o8daRflUeFlC8EK6qY2UO04K
         Gs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        fh=JzHFvlqP+3gh9gDvt6b/IHCvQfbldANl6s8YLaZWbYY=;
        b=ZeTPLaJITcCemVg4n28pIAyPU944Pq5OtlUf5eTAiS+BRuL/Qz+fymJ8EO7684RTeM
         vW+my0itwcdR9DyPgttwoFzmKI3ajxFvGNRXv+RF0pb/TN9Kf27AcveFc9XkIK8+561M
         8mJlSEYtjAxGOapCM5yLMfKP6k2nslbbun1LuNgATiQ9YLWzKh7NEto1kODigxxXutQt
         ixPQWcSvZzKEup61HUZILSvmi2H/w6gGBw7ZyEJFOfu2aq7FFX9HIRD+khJHZUKK59Fm
         JuuoB2EWyZ3Bvyb8Ja2fmtSE7m4qzXKZswRYZkXiFwSRDi74qHV6WAOhVEVUwnzC0+mS
         03NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781084045; x=1781688845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        b=O48KkhDw4b9ie38dSOwhENbOhrKFtAC9GMzhH5sNlNAUv7HMI2IlSijZhcpI98us/o
         DYdZ0rxjcBsXb48g/PYWEZ78JaefrT0mzytZlBBabznYv6VC9LJYZL4t5ZuvqJWh1xE6
         by0Lyhk2R18ojiBi/MX2XC9Jm0RDJ8H3OelBW9ua1Xrq84tuw0iKurPciNNQMczRMaNZ
         1afo/wQ6fr43ySzDaYqgVmqIDV1XV1rkVLScsWilGGN17NOq44srPbMf7f/6RU1K9Vot
         jL/Jmcxqj44P/p21JKikTJhAvy458fhkpNGaX6w5RaqtdPwRXTtVutkueUmgWbGc/QxU
         BotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084045; x=1781688845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        b=QmqTASW1i3/QU55gHwdrnN+jLlBv90mIeua2zZM/sJxYD8PqHz6IO8cAyuqgOxvjOI
         9s0zzNEKpIBdlu8wmJ9Kl7ZNMrr/8QI7M2yr6/su5LqAWesebg0ngRF0Tz1DlSxm8lJO
         NwQyN/wWkgfFQxSi2+nOVSxP0ygvotSW8wi6C7XmK/W06/m/AeP97Di/AaVyxv/kIyd5
         5U1UGHrsEbhRyG3/FtTE00jk3149JFezYl1U1A0qc2Bc/0ZXGiRN0wluWMeDLDmoHnCV
         CD2qTZpXt7Kt99Jk5iD/xvBFYGt/FDpZk5t987z4FJDB7w8644Ov9SDNNBZgPx17Jym/
         jbrg==
X-Forwarded-Encrypted: i=1; AFNElJ8yCIT3m9C3/oEelqucsBQUd+K3r0Mt45kHJOFFVpd/5VvHQrJeLxJjg/yxR3dkzK5lUrrXH22Cn6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2R+ChHo/lg5BUObVDzaPUsBGbHIPpU38EF5kyCplvjzrStunv
	XQhGmZZNxa/E1aCYDSXU+B6iiEb1CbO8qCLEH1tGfO7Y8+2Om6GSvRbrtU6Tu9UTC7wb6RgTVx/
	bTBydM0mlN/FcQLEqNOS8WYXE6+QlhYA=
X-Gm-Gg: Acq92OHA8ASBthJm9ZLd/meUGLHZOlVsvgKqnE9b/E1QywlpmRXrf5YNs2agfz1dqAT
	uKbW8sXVWnodq+7LQ3AQavda76qtWYgzLNjGSB0ogI2wwajvUYX3GpM2mcRNI+Fo0kpbmT12iJJ
	mUdU4zeejUVma5kWzSHFmYeGt4Ubv+VMLiyRsD9sYF+88Wr/EM/Z3YCMcnmTmQei1/pDkjw0UwA
	NFHulfBwh46wW3lQZdy+z0/BSUvakgkFVqX8IWEfbPUQLmfTGjIMEEhidtAXxgOO8LHTUleKn62
	aNnLBABxIDhDKTVZwqdXT3tGnh/nsyBjyKvJY1FJvxqP0HCAxJJpOTvRURGSrqqDG5T3UB4U4DP
	y49Q=
X-Received: by 2002:a05:7301:22a3:b0:2c1:7793:7bbb with SMTP id
 5a478bee46e88-3077b2615bamr15346976eec.27.1781084045265; Wed, 10 Jun 2026
 02:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
 <20260607234343.22109-2-kimjinseob88@gmail.com> <20260609-glacial-colossal-38b4937ec620@spud>
In-Reply-To: <20260609-glacial-colossal-38b4937ec620@spud>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 10 Jun 2026 18:33:54 +0900
X-Gm-Features: AVVi8CeIpvFBux1wEAZY6Bff68TrrIEZ3OnIKWyWrYDouz-MKRCStpTldHFDGGg
Message-ID: <CALMSew+cL0_kG6W15RapxLtE+Fw2_DYdrYoRFSjENQktWw2H4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: iio: add Open Sensor Fusion device
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:jic23@kernel.org,m:linux-iio@vger.kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91812-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kimjinseob88@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kimjinseob88@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B0A8667E26

> Do you think it makes sense to permit a regulator here, so that the
> "host" OS can power on/off the board running the osf stack?

From the OSF hardware side, yes, that makes sense.

The current prototype used for testing is powered independently, but an OSF
device may also be integrated as a host-powered UART peripheral. In that ca=
se
allowing the host to control the board supply through an optional regulator
would be useful.

Unless the IIO side prefers otherwise, I will add an optional supply proper=
ty
to the binding and matching optional regulator handling in the driver in th=
e
next revision.

Jinseob


2026=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:19, C=
onor Dooley <conor@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Jonathan/IIO folks,
>
> On Mon, Jun 08, 2026 at 08:43:38AM +0900, Jinseob Kim wrote:
>
> > diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf=
.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > new file mode 100644
> > index 000000000..a4049715a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Open Sensor Fusion Sensor Aggregation Hub
> > +
> > +maintainers:
> > +  - Jinseob Kim <kimjinseob88@gmail.com>
> > +
> > +description: |
> > +  Open Sensor Fusion is a sensor aggregation hub. The hub exposes an O=
SF
> > +  protocol data stream over its host interface and may report capabili=
ties and
> > +  samples for multiple sensor classes. The Linux driver discovers the =
actual
> > +  sensor channels from OSF capability reports instead of describing th=
ose
> > +  sensors in Device Tree.
> > +
> > +  Open Sensor Fusion is not a generic industry standard. Public projec=
t
> > +  documentation is available at:
> > +
> > +    https://github.com/opensensorfusion
> > +
> > +allOf:
> > +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: opensensorfusion,osf
> > +
> > +required:
> > +  - compatible
>
> Do you think it makes sense to permit a regulator here, so that the
> "host" OS can power on/off the board running the osf stack?
>
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    serial {
> > +        sensor {
> > +            compatible =3D "opensensorfusion,osf";
> > +        };
> > +    };
> > +...

