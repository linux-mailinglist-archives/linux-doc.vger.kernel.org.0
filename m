Return-Path: <linux-doc+bounces-94334-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TNZF1f3RGq54AoAu9opvQ
	(envelope-from <linux-doc+bounces-94334-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:17:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C65416ECADB
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 13:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iOmXZPsU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bWVfbAr0;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="J/mRPrZ5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LTOtvQR8;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94334-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94334-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B4030550BC
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 11:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C13C21B191;
	Wed,  1 Jul 2026 11:14:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D13B14BF
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 11:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904457; cv=none; b=Bzi84B0O9TIDIl9g/TFahtR1zL6q3SKBH+Gco2FWAvUQebM3gTqOfVX5Xlpd/8Ypci6QwphTSXLv/IyeINgXIbhGNfR7suCyaFSVt4+E8nLinwK0Xh/+Bzgulc/X78Y9wwkynIKrRdr39YwUE8wcQpuSliROQMF1kKAOYR64edw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904457; c=relaxed/simple;
	bh=97jJnVXBJlZLEpZ2lBZdijodE87x2KbhjGFu6B+E/V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euf7GZ1gV/JgDOA43ICNN8Lofqrc9pzdOmCzK2EhNYZohrm1KAlLGSzdIxfQAuU/2obmu45XgBOoSTLViPG0CIdrSDxSU6aWbGth9AyiBOnlxZRqCZIHprjcqL39WH8tlNZidSnPdFZkwsEgnmYYajre+uPiyVKfVlaRaTq6dm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iOmXZPsU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bWVfbAr0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J/mRPrZ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LTOtvQR8; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0DD67598B;
	Wed,  1 Jul 2026 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782904454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yo48ALSMv+SDMF+5eUPALzxwluiPRufT6oTCmzn1Qc=;
	b=iOmXZPsU4Srs/JWyYBJ4Re9SKdr9uoBn1b7f/5WNRdHhmkY6xYJIo8isAQ/FsJxXaDvyUr
	KdQ4mBd60u4hNPQZ130ep4T3WaQTDvFvg3rJwM9j3c++0PsOuRCrwyy2uq/v6gr/8GGYl9
	klt4qCrprDRrT/wzkM0W2Wg92T2ngiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782904454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yo48ALSMv+SDMF+5eUPALzxwluiPRufT6oTCmzn1Qc=;
	b=bWVfbAr0JtOgnQPYEOt4erWqf21BRfR+9dhj/dN0oHHkDDv6Nm6g0Vm5ESBIdgeauyzTqm
	Tv84kYH5kMZ+cSCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782904453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yo48ALSMv+SDMF+5eUPALzxwluiPRufT6oTCmzn1Qc=;
	b=J/mRPrZ5ahTdbEwoOA6VeixXDTEBOh7AknxSfYBL1g6iY0o8FeH6XonVJmOs91BuxBZWvt
	RkQeBjtxoIi3QheTdS21ettAO2BTjD94I5CxXmWq/xgpMRnQQL/bRVc9qXr+KhszbJH96K
	iU+P7lRyRtkI8Q6CIATgdvUaj+p/xYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782904453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yo48ALSMv+SDMF+5eUPALzxwluiPRufT6oTCmzn1Qc=;
	b=LTOtvQR8mdX8Vi1+Qw0Q2m+3y6dZdDhtQ4Mqr5l12E0wq40zWDojJIBzUZQTV+n3RORDuy
	E0btJELhRW8uKHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C225F779AA;
	Wed,  1 Jul 2026 11:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nYElLoX2RGonfgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 01 Jul 2026 11:14:13 +0000
Message-ID: <8103a626-d07b-4b20-b10e-d258485176ee@suse.de>
Date: Wed, 1 Jul 2026 13:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nvme: Introduce service-time iopolicy
To: Guixin Liu <kanie@linux.alibaba.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, onathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
References: <20260617114602.2224074-1-kanie@linux.alibaba.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260617114602.2224074-1-kanie@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94334-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kanie@linux.alibaba.com,m:kbusch@kernel.org,m:axboe@kernel.dk,m:hch@lst.de,m:sagi@grimberg.me,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-nvme@lists.infradead.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,suse.de:dkim,suse.de:email,suse.de:mid,suse.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C65416ECADB

On 6/17/26 1:45 PM, Guixin Liu wrote:
> Hi all,
>    I developed the service-time iopolicy in nvme native
> multipath, please review, all comments are wellcome.
> 
> Guixin Liu (2):
>    nvme-multipath: add service-time I/O policy
>    docs: nvme-multipath: document service-time I/O policy
> 
>   Documentation/admin-guide/nvme-multipath.rst |  31 +++-
>   drivers/nvme/host/multipath.c                | 165 ++++++++++++++++++-
>   drivers/nvme/host/nvme.h                     |   6 +
>   drivers/nvme/host/sysfs.c                    |   5 +-
>   4 files changed, 202 insertions(+), 5 deletions(-)
> 
We're still waiting for the adaptive I/O policy to be included, so I
guess this patch should build on top of that.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

