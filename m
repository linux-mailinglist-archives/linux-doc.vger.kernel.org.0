Return-Path: <linux-doc+bounces-92906-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eL0rMsAJNWoymQYAu9opvQ
	(envelope-from <linux-doc+bounces-92906-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 11:20:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04A6A4EE2
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 11:20:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sEEMN7Fa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92906-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92906-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AA5B3011061
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 09:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EADF351C3B;
	Fri, 19 Jun 2026 09:19:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F732A3D7
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 09:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860798; cv=none; b=C3E3GgIKA6J1nl3dPLg0c20d4VB0El9tiV1Z8RVj1VLaMq+nL4kfor6V1xCrlml8sVR0D8P81t4rFwPTClRdw4JhkgESHZ2/vC/14Wyu36A8OUPnA+td9QuiYRhRXt9X1YqYMsetxY50mze6KHmvrhR8QLF9xTr00NFc7FhfjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860798; c=relaxed/simple;
	bh=ITR0EAJV4oH/5cLUjFuPZRjTNCAbDIVCQcL/xBUnjtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMmyNEr77cIG4AEE+y8uXt3LBGYtQVloYEDJp4xZQ0dMSZKxcxxmnhecllusMKdUPnrVujzowzscr95sfklfij6NZmNzWB69LZndwH3KdkrjjuprPAKxbK3OsJr7hjQk7JtNji5Qyae1JRenBewamnoVveMYl07Y3mlhHzQUeBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEEMN7Fa; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1453113f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860795; x=1782465595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+fYbHkWsaW2PxLYmY+byBPAizGKwZAbaivlyPXKvt1s=;
        b=sEEMN7FatB2HLbvfDCtkiP42Q43Q5jT65moL8M4yTtPlunzB2ToPomZIyPogg0lWtT
         hqJM+KYtNMfwH5Bq7RekCOA2AhYYn58W8XGXm6BM74f9+wjI0fEztqX+sVWKWLfl0U3x
         1yEa2uNLt37v2V1qZWBxo+E/IyQ+e6ToXHyy0Qch0pRUNVfrh4SiK/2y/eIDK/PRzKrL
         IlVz4ar8H1UH1HuI4yt3TEMF/w2TVrRBqpyUH7RgbDCziGMEmkK6SLIP13h+a5xpRMqM
         YaMYvyejRMr30xQ6w9Z4JA1Z7SZJ+B1EqWBKZqTxuvAAGmat54Owc+hRE6n3ytteqKlo
         OwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860795; x=1782465595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fYbHkWsaW2PxLYmY+byBPAizGKwZAbaivlyPXKvt1s=;
        b=JOymFqroFMLLJ6+w7yEPAZfshkUCpEusQcAwgB2C35d04OogLFVhP3TG8gpUxHYlIm
         xnWXb7E8HsQjrKl32YZYRL+TQJfu7zYT4/vz01kvgTfPIdl+Blpgap0ysxvEbq2EUKNA
         65xS03skkL9Fb6fiEjci7lhBer/l2qlU+KETNa16NVuDG135LZej2BwwyemfH/E9O3+i
         bM7Iyi6N8EN9F379FA1l3FFLVR3du0T4rpeuQUMdwdPZar72tC83/CmiT2+Dz5Z6hKQX
         E3AH1lLpsuasI3CCPmrLiY+r1ZgPLzt5QyJrNkS5Q+jIJcc0oszSPukV5aWsSg9isLjg
         kkCA==
X-Forwarded-Encrypted: i=1; AFNElJ/H+MXI44gwvyQO+v/9wTbG/3zXD/pRPeM33WUMFIrZJ9eTZenPasNKvlw86PyJIVX02E1/AKldI1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckGZdeOorBE9kLnxoYu25bkEBtH8Jy1r/EfDONTaS9XxY16D4
	lvf4BHL6uLEhlgz9qYXRnQbtfixSphwZkn7mBwFxrrJtlxfTvaFMrrB6
X-Gm-Gg: AfdE7cmL0bb6FW0GrSapT3obf123A7itB1BS4hbKdFZKss+tMglWk2recMWOkaWOohp
	yutiCYxrF0n7fDoe84OCKHEeQpKT7aCDTLAX55+AKHpaAZILIKJ1s1bncYo7MqeTaRS9srVUu/D
	QMfTGvahtAE5EatdtF0TqqdklFAvWaFe34wYROzmenqoLZeI7tkeOq2+XMCJUe9cZjNNuUuHCiD
	1ayi6ThTtUvfQkJVt/2Q4cwR8unNcNYNEfx0JrWYobYoz9gxwJnFahrxmYa9ovY3FIynfefjiR3
	swJrG7BdGnSrvnICvLNZOqEJD1PYLAmB9/mtasOwjZe6RXSvPTUzzr/nkXrXLae7Q5aRYGg81RE
	Ec/nPwmOt6jhl6ZhmOWHu3t/ASpPGCQTu7RHChvnNmIZHhFcPoHxXWtJtvFSpaR8AUzZAbh+w1B
	4xSXxM
X-Received: by 2002:a05:6000:46d6:b0:460:3233:66fd with SMTP id ffacd0b85a97d-465097891bamr3238584f8f.40.1781860795025;
        Fri, 19 Jun 2026 02:19:55 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm6304049f8f.25.2026.06.19.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:19:54 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:20:56 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 06/16] iio: core: create local
 __iio_chan_prefix_emit() for reuse
Message-ID: <ajUJm_Q6Mm3o2NlL@nsa>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-6-79125ffbe430@analog.com>
 <ajQGTQ1_qcOwfzne@nsa>
 <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>
 <ajQ1bZSNHQ96pyJx@ashevche-desk.local>
 <dlisetsssjoyodmv5ubl4rzhxtla3g46mrrzv2f65nqecel5fu@dqiqsayr4aip>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dlisetsssjoyodmv5ubl4rzhxtla3g46mrrzv2f65nqecel5fu@dqiqsayr4aip>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92906-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:455.rodrigo.alencar@gmail.com,m:andriy.shevchenko@intel.com,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:455rodrigoalencar@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nsa:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A04A6A4EE2

On Fri, Jun 19, 2026 at 08:43:24AM +0100, Rodrigo Alencar wrote:
> On 18/06/26 21:14, Andy Shevchenko wrote:
> > On Thu, Jun 18, 2026 at 05:14:19PM +0100, Rodrigo Alencar wrote:
> > > On 18/06/26 16:06, Nuno Sá wrote:
> > > > On Thu, Jun 18, 2026 at 02:27:22PM +0100, Rodrigo Alencar via B4 Relay wrote:
> > 
> > ...
> > 
> > > > > +	dev_attr->attr.name = kasprintf(GFP_KERNEL, "%s%s", prefix, postfix);
> > > > > +	if (!dev_attr->attr.name)
> > > > >  		return -ENOMEM;
> > > > 
> > > > I don't oppose the change. Looks like a nice cleanup.
> > 
> > May I oppose it? I found use scnprintf() is harder to follow in comparison to
> > nice kasprintf() that takes care for the dynamically allocated buffer.
> 
> In the next patch the function is reused in a sysfs attribute read handler,
> a context wich would not be nice to have dynamic allocation. vscnprintf() is
> the main building block of sysfs_emit() which limits the buffer length to
> a page size, so I used scnprintf() trying not to deviate much from that. 
> 
> kasprintf() it is still used in the caller, where the logic was a bit confusing
> as it tried to avoid multiple allocations.
>  
> > Also there is a chance to get a name silently cut due to insufficient space.
> > Besides that this function can't be used (again due to 'c') in kasprintf()-like
> > wrapper. I do not consider this as a good approach. Have you looked at seq_buf
> > instead?
> 
> NAME_MAX is not the maximum length a filename can have? I suppose there should be
> enough space for the channel-prefix. Indeed, seq_buf can be used and it cleans up
> things a bit as it tracks the the position in the buffer.
> 
> > 
> > > > But bear in mind this very sensible as any subtle mistake means ABI breakage.
> > 
> > Which immediately raises a question of test coverage. Do we have one? If not,
> > this code must be accompanied with one.
> 
> Agreed. Will see to have tests for v7.

libiio now has an emulator backend. Maybe something that can be used to
test this. But ideally we can have some kunit for validation.

- Nuno Sá

> 
> > > Yes! I tried to be careful... this is dangerous stuff!
> 
> -- 
> Kind regards,
> 
> Rodrigo Alencar

