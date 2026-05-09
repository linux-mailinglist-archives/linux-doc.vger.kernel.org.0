Return-Path: <linux-doc+bounces-86610-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ikEAOSoq/2kn3AAAu9opvQ
	(envelope-from <linux-doc+bounces-86610-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 14:35:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8B4FF9F2
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 14:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE9813006124
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 12:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D7F3168EE;
	Sat,  9 May 2026 12:35:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from cygnus.enyo.de (cygnus.enyo.de [79.140.189.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AD1E49F;
	Sat,  9 May 2026 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.140.189.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330152; cv=none; b=ug/V3p/S76Lk8S0lCc1EuYehGuoWKetiB5qz9NZFF6MpPc9iaFZaN6qEtVuGUgF8+/32NGhbwT2A8ZEE+tI4MG9X2Ab+ZQTc7R/HRALiyr4N084sHahL5nS4vemQQ7LUsd1/qRaOMZFJDtw2525ddh71kSTH8MyagNnRajcuVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330152; c=relaxed/simple;
	bh=dA8qeLx7sAMr3sfR0A9AuZoQc5FZDHMi9PENj+xCDtw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ecGlmuCp5wPjTBHmcFm0sdnDeqUIOw8ybfEuF8ugR0hR3Scj1lGlRDTsdvbequTu8esKpm4tUJr32HPguMpe8Uy7bVSGC4SFTqrWk8kF8jNoil8fmS4XdvpO5FrRngzHffehT0KKYWUHHaw5ONHKdJCHzyn0sekIYT7LHrUEC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de; spf=pass smtp.mailfrom=deneb.enyo.de; arc=none smtp.client-ip=79.140.189.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deneb.enyo.de
Received: from [172.17.203.2] (port=48887 helo=deneb.enyo.de)
	by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1wLgO0-0000000060f-3vFM;
	Sat, 09 May 2026 12:02:24 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.98.2)
	(envelope-from <fw@deneb.enyo.de>)
	id 1wLgO0-00000000KvJ-37ts;
	Sat, 09 May 2026 14:02:24 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net,  akpm@linux-foundation.org,  skhan@linuxfoundation.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit
 mitigation primitive
In-Reply-To: <20260508195749.1885522-1-sashal@kernel.org> (Sasha Levin's
	message of "Fri, 8 May 2026 15:57:48 -0400")
References: <20260508195749.1885522-1-sashal@kernel.org>
Date: Sat, 09 May 2026 14:02:24 +0200
Message-ID: <87ecjku6y7.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 9DC8B4FF9F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86610-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[enyo.de];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fw@deneb.enyo.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.842];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mid.deneb.enyo.de:mid]
X-Rspamd-Action: no action

* Sasha Levin:

> When a kernel (security) issue goes public, fleets stay exposed until a patched
> kernel is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped on
> the next reboot -- by which point a patched kernel is hopefully in place.

Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
with typical Secure Boot configurations in distributions)?

