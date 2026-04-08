Return-Path: <linux-doc+bounces-82862-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NNcEHK81mnLHggAu9opvQ
	(envelope-from <linux-doc+bounces-82862-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 22:37:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 858953C3D90
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 22:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FCE5304EA8F
	for <lists+linux-doc@lfdr.de>; Wed,  8 Apr 2026 20:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B7E3DB629;
	Wed,  8 Apr 2026 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rxtx.cx header.i=@rxtx.cx header.b="I+Xz0C/O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx.rxtx.cx (mx.rxtx.cx [185.235.143.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776A3D7D69
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.235.143.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775680538; cv=none; b=Ymvnn43EXbHEYIH6OWPpf7YBbVoUQupnGh4HleHdoPqEdCX+GVRDBupIchvOoHbAb6jJL5iK/NQxtWMxo/YMIbLuLRfZDtEPemNj4CDERRRsSm4jidA65zcRIolNdkZfuoJFiWrfrOfUpz9scO/pTMDcQ3i6oOQyUc7PmttFjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775680538; c=relaxed/simple;
	bh=gYhSxam0uGQhjp3WaLSV8gd2CMxRTxwtVY6EllHvp3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQDI+rrbFjvKPAb7fafDGN45YR0x0XSWLQcS+Y4QuW4iDshIk+8inUElTx3kt28tCCyV66ZXnQ47+DJSNgaD5posslvTZi69XU6e1ZD4tdXf4DuMfru5H2tS5JYEJ84CltfZpfFiUPcV+X4thFpCZ0z9reTak38uCWIaEOtuLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rxtx.cx; spf=none smtp.mailfrom=rxtx.cx; dkim=pass (2048-bit key) header.d=rxtx.cx header.i=@rxtx.cx header.b=I+Xz0C/O; arc=none smtp.client-ip=185.235.143.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rxtx.cx
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rxtx.cx
Received: by mx.rxtx.cx (Postfix, from userid 106)
	id 9D1632073C; Wed, 08 Apr 2026 20:29:05 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rxtx.cx; s=s2026;
	t=1775680144; bh=gYhSxam0uGQhjp3WaLSV8gd2CMxRTxwtVY6EllHvp3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I+Xz0C/OpUzMQsEiu83+3L1Ez7zIQBWa+eBi8TpeeIbFtOXnMIReQ6v3BlbeByouQ
	 DKPSM3Ms54oTz8nzobWblabFNXgJeiDBLJ6OPgQsNcfV6DTU2Lat+Z6W8PkjJ8QIZ1
	 j7htNgYeyX8RZsoPFsXs1bL7FJ1xcQ7KbcbHpFDqbO+qT/25ils/FbH74hIY5txrov
	 59/e/GmTuNkL9HBiUQQUrNw1eKFW5iu633+PY5onOjXcJ5RU2RRRZPcYVRqiU1OIzM
	 MXEd4gucVxe/Gmwwl2+h/RCn4xjSRLzqEAOJq+Tj5OfhN4kNoQQxWRMuS1vWC2nzy2
	 h+FEZHQybKS0A==
Received: from [IPV6:2001:7d0:4d00:2500:10f7:e69b:fe86:ea8] (0ea8-fe86-e69b-10f7-2500-4d00-07d0-2001.sta.estpak.ee [IPv6:2001:7d0:4d00:2500:10f7:e69b:fe86:ea8])
	by mx.rxtx.cx (Postfix) with ESMTPSA id 6D1D620385;
	Wed, 08 Apr 2026 20:29:04 +0000 (UTC)
Message-ID: <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
Date: Wed, 8 Apr 2026 23:28:08 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING
 WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
 Veronika Kossmann <desu.git@rxtx.cx>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
 <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
 <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Content-Language: en-US, et-EE
From: Veronika Kossmann <nanodesu@rxtx.cx>
In-Reply-To: <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rxtx.cx:s=s2026];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82862-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[rxtx.cx];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,rxtx.cx,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,roeck-us.net];
	DKIM_TRACE(0.00)[rxtx.cx:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nanodesu@rxtx.cx,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rxtx.cx:dkim,rxtx.cx:mid,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 858953C3D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 10:12, Eugene Shalygin wrote:
> On Sat, 4 Apr 2026 at 06:38, Guenter Roeck <linux@roeck-us.net> wrote:
>> Sashiko has a problem with this patch:
> I must admit now, that these _SET macros were a bad idea, it turned
> out to be too easy to misread. I'm going to remove them.
>
> Veronika, could you, please, show us the output from sensors with this
> version of the code?
>
> Cheers,
> Eugene

Of course:

$sensors asusec-isa-000a
asusec-isa-000a
Adapter: ISA adapter
CPU:          +37.0°C
Motherboard:  +38.0°C
VRM:          +51.0°C

These are relevant to actual temperatures.

Best wishes,

Veronika


