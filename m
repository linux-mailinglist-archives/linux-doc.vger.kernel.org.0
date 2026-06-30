Return-Path: <linux-doc+bounces-94189-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uH3nIMHhQ2rpkwoAu9opvQ
	(envelope-from <linux-doc+bounces-94189-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:33:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28D6E5F97
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l9gR71D9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94189-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94189-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6C623081EBF
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ACC3E9589;
	Tue, 30 Jun 2026 15:29:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED13E558F
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833360; cv=none; b=HP9sMaFCmXh0E1njkzhn0SkGVaToJwhs6Se2MXZAPgBWigWbPL0er2PbNtRiglOCW7KfywuW3tAFvOZ797WtAdVnUsplq7NNw/+ENptpVWWn2sow94fwNpO5uwbJ3zMqPJWp7+Yf62fJhf9MjacCEIsL/rhDiZVf9Mk5BvwUnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833360; c=relaxed/simple;
	bh=WQRlvOCE1auyNFN25FfdvwAf8yTgJGPbfJqgPD3mkZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZcM53aIAZZH0wyYjtMhOSs4RiTOM5+LL/sJ94p6cejbNq+ZFPuK80UYpA8gd5YhzUil3X92IkO1eo4hCutIXaCrLCng1xXfL2w813eORyuFyAPsM8OPxtNvPzjhwIgq5OLt/UaFSxR+vEb4PCgN4OzThGBWVN6144FEy4FNnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9gR71D9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481EC1F00ADB
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782833355;
	bh=WQRlvOCE1auyNFN25FfdvwAf8yTgJGPbfJqgPD3mkZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l9gR71D9A6uav7d5RvE8QcK9rQeFL2y3W1qche7RQUI9lOP2HhOU7uzwnleAUzXDc
	 H5xzmFMe3gMPOEwSRZqy9u/bJQjUvWcKmo2ID//e3KXWnM2A5FwCLI5whSjBhSYTN+
	 lcwp6M4pno6s8K0fCEvGVh96vBQegwRBPEzKykcKZpHhUMXr+KFvm07eaUZKm3Yk5h
	 rLhaA+01Q0wiv1qrc3JC2BBJBOUCPHTRJ+lpBNpelvyEolCVdX1OkgTdQ3rkdxZZSI
	 wJ3JrwmjqDTYwedbN/JY8gACsAP0ZLdFuRAO47jIJUuO9anmhtrPaBcm63E6d2+4D5
	 Puuc2/AUqIJzg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso481058066b.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 08:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoR1PbPkS8qfr5iv4hRbOs1ycRkRaCnKo75W8u3anPpil1pdtpENc39JzDC2KJY2ShYfzKHtUpf67E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyogHlga0kmMwQXPBrBBI1KgLtaH8LxLQ7FmJnC/cghGar8R1QK
	1TxhEoEEM6oR5iIUldJJJL3VzmYzGwbRyRj6dOu3njhNUd00Ks3aMJY5vpbTy9yQYed2ZOgOghy
	HNNybp72r93qYdO6I8XmYAVXtqpzIQA==
X-Received: by 2002:a05:6938:a08a:20b0:c12:7e9f:5ae3 with SMTP id
 a640c23a62f3a-c12872a34b4mr141132866b.15.1782833353756; Tue, 30 Jun 2026
 08:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-s2500-mac-phy-support-v5-0-89874b72f725@onsemi.com>
 <20260614-s2500-mac-phy-support-v5-14-89874b72f725@onsemi.com>
 <20260615041056.GA1426553-robh@kernel.org> <CYYPR02MB9828308552BBC60427E8EF2283E82@CYYPR02MB9828.namprd02.prod.outlook.com>
In-Reply-To: <CYYPR02MB9828308552BBC60427E8EF2283E82@CYYPR02MB9828.namprd02.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jun 2026 10:29:02 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+H5qSep2+Wd6i+pir0fK8NDAdPj=7Ka7+qoG82QZeFqg@mail.gmail.com>
X-Gm-Features: AVVi8CcE2u2osQeWDN_q0N5A5Le8-51ZMka5QYUjnRlp7Tx6YdkygDNIGVndh54
Message-ID: <CAL_Jsq+H5qSep2+Wd6i+pir0fK8NDAdPj=7Ka7+qoG82QZeFqg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 14/15] dt-bindings: net: add onsemi's S2500
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Piergiorgio Beruto <Pier.Beruto@onsemi.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
	Richard Cochran <richardcochran@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jerry Ray <jerry.ray@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94189-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Selvamani.Rajagopal@onsemi.com,m:andrew@lunn.ch,m:Pier.Beruto@onsemi.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:parthiban.veerasooran@microchip.com,m:richardcochran@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jerry.ray@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,onsemi.com,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,microchip.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onsemi.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB28D6E5F97

On Mon, Jun 29, 2026 at 12:07=E2=80=AFPM Selvamani Rajagopal
<Selvamani.Rajagopal@onsemi.com> wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Sunday, June 14, 2026 9:11 PM
> > To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
> > Subject: Re: [PATCH net-next v5 14/15] dt-bindings: net: add onsemi's S=
2500
> >
> >
> >
> > And you are missing tags from prior versions. It is your responsibility
> > to add them.
>
> I added the prior version's link under each version. Somehow "b4 prep --s=
how-revision" command doesn't pickup the older
> versions. It shows v4 and v5 correctly as the emails containing patches w=
ere sent in a threaded manner.
>
> But with v1,v2,v3, as each patch was sent through individual email (with =
proper subject line, of course) using outlook.
> I don't know if there is a way to fix this.

While links to prior versions is nice, tags means Reviewed-by,
Acked-by, etc. lines. If you get those on version N, then you have to
add them on version N+1 and later unless there are significant changes
that nullify them. However, you don't need to send another version
only to add tags. The tools will pickup tags from the current version.

The only advice for outlook is don't use it. It is incapable of
following maillist etiquette.

Rob

