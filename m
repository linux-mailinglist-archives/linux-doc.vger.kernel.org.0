Return-Path: <linux-doc+bounces-83087-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIGANOhH2mnWzggAu9opvQ
	(envelope-from <linux-doc+bounces-83087-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 15:08:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C593E00E3
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 15:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D83B301A7E6
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 13:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6997D1F418F;
	Sat, 11 Apr 2026 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RVAc8Elf"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CFF4A0C;
	Sat, 11 Apr 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912931; cv=none; b=ik+GDisZoFEpgQvDdY9G/cxfZztLSRDoGrlk/8Yh8DRWdMQnqqtzNOR2+22DJizh7MOBTyiZwv+xbO1kfN6wZn8hPz3DYeNqaC3RcoFUSMYPI+q14/NXOVBOXLoFX8BwhYfmvU+7h63blbod+qyjJMofjBkbnFelAMWuOjWds38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912931; c=relaxed/simple;
	bh=K6tulqhHSFwM3NLIubquX0sIAdwrVMLg5T0qmkgLIjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hEqij3rWUrR8dX7kCIjurSMBG3w2lsnyQNLa2Qmb7d46GBKPTpLIupkI1rmCZySCqxpUUTOV9TPcG4LGnv5rnnrs8h3skFwBnAEAjTqp1BGrTS997XpRlk5Mpx/I5N+hGTw9PMhYWBmDUN3KiUoET9XVYabCFV8BNkc9Q9XsaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RVAc8Elf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F3C4741089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775912929; bh=K6tulqhHSFwM3NLIubquX0sIAdwrVMLg5T0qmkgLIjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RVAc8ElfgAaiVZbmqHcuSmTEVqOiy4ZcrF3Z/9QD8rZNlxNlhni4Pn/KQ0a9hf3bo
	 aT1Og8Ny1+HA5u8dror7RVV3odiujtOckgy1tQVPk9W4D00btQROtkIaeoZuGiGVff
	 vehL/JEM0u1s69NqcsvgoW56Yk4qPY6651mSXlsCXccUL1BCy489jEr6esd1ghR038
	 TWZ3pVsA/xjZTtBC2IN4OuKHq7AenkqpIv3fgjjQuMiUN8TAjo3VoZXb19dP6kME7n
	 yR6s+z2NiiEgvybZaTiSveExgyLTGyhw59fMoa4OAwgjq8aNM7lySWYdtaEpR9l2cd
	 2wnDgZSUt77zg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F3C4741089;
	Sat, 11 Apr 2026 13:08:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
 Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Ming
 Lei <ming.lei@redhat.com>, Valentin
 Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
In-Reply-To: <87qzomzv8q.ffs@tglx>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <87wlygb3wd.fsf@trenco.lwn.net> <87qzomzv8q.ffs@tglx>
Date: Sat, 11 Apr 2026 07:08:48 -0600
Message-ID: <871pgl1w67.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83087-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: 18C593E00E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Gleixner <tglx@kernel.org> writes:

> On Thu, Apr 09 2026 at 08:32, Jonathan Corbet wrote:
>>> This documents what we have as of today and how it works. I added some
>>> examples how the parameter affects the configuration. Did I miss
>>> something?
>>
>> There's been a lot of silence on this one... should I pick this one up,
>> or are there other plans for it...?
>
> Looks good to me.
>
> Acked-by: Thomas Gleixner <tglx@kernel.org>

OK, I've applied it, thanks.

jon

