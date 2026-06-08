Return-Path: <linux-doc+bounces-91488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKcINLY5J2o8tgIAu9opvQ
	(envelope-from <linux-doc+bounces-91488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 23:52:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171165AC7F
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 23:52:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=acm.org header.s=mr01 header.b=z+H+Qlz+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91488-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91488-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=acm.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D5F2302FA68
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 21:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF7D3AFD18;
	Mon,  8 Jun 2026 21:51:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBB3AFD04;
	Mon,  8 Jun 2026 21:51:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955505; cv=none; b=Gs1eGzJfi2PiEMfKSrlZCXJ0iX36eTKQ8zYoaCkgvV+9UozxmrJlfc3yGqsmz/5WFN4ki4HMV0j7WhCbbr5Moj4zERKUAX0P0Qznx/EceVKnwNNfDId3KnSj1/dLoYjJS9DKig8wcGuCX3t8dhUayp2+CtNDVvFdMBEPluIVmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955505; c=relaxed/simple;
	bh=ji2SRD9OiIlpJ0oQRCfY44OaehHQo9epvoidbcDoeLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dbr2vj6+sf+2Xsv2OoL9RjlWzeQR/riuk8uREv5uYqnNIpRXJ/9u9IeCy3Gyp234BHvTtc+KZqDZ3n3Y2tAfBGrH2/SGse+YEJ6PQ30BiJmlPxFvoftuic/p6dnkGx2+mgBI2NyedgBNadbRdYtjqxBi805KkYFEAaBG+U0Yuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=z+H+Qlz+; arc=none smtp.client-ip=199.89.1.14
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gZ5NH6hJHz1XM0p0;
	Mon,  8 Jun 2026 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1780955500; x=1783547501; bh=ji2SRD9OiIlpJ0oQRCfY44Oa
	ehHQo9epvoidbcDoeLg=; b=z+H+Qlz+5i8np5k0LbDlUEMj5JI82BOj6ajwjVyG
	OqZ5NGhqC1eHcTKbsr9zV3+/v8qOWAwymfYTqRDclpuBPmoCVRhOr3/8bimzuqjz
	W0h00m9NpdJuLxRclg54TZBJDFWJWBzHVMiOChXAqo02QWMVq6FrHa3YQ7h9Ep6s
	vJVc58HlZNsT7nubZTTSpzHTXuDTXGlgNKGVIcNI1V7DLGZLYsKUwouSHkBiTCKN
	+rWHJlg6b0emy7Q4ecZrxvlkmWF27NsDnaAzKcPetvQZIeXjcW3/BLcEpAn73ZXX
	Q2K5XbXQ7FX22mKMxFpSeN7WO7xD2E7ag21aZQ/wWji4Qw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id dWStyjP05Ljw; Mon,  8 Jun 2026 21:51:40 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gZ5N953fzz1XM0nt;
	Mon,  8 Jun 2026 21:51:37 +0000 (UTC)
Message-ID: <0074f8eb-993c-4c03-ac04-7588d4333e13@acm.org>
Date: Mon, 8 Jun 2026 14:51:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] block: add a macro to initialize the status table
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>
References: <20260608051416.1205282-1-hch@lst.de>
 <20260608051416.1205282-2-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260608051416.1205282-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91488-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bvanassche@acm.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0171165AC7F

On 6/7/26 10:14 PM, Christoph Hellwig wrote:
> Prepare for adding a new value to the error table by adding a macro
> to fill it.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

