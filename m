Return-Path: <linux-doc+bounces-91203-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JwxqEULKI2oPygEAu9opvQ
	(envelope-from <linux-doc+bounces-91203-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:20:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D964CD16
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z6nlRls5;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91203-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91203-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE5F6301A142
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EC625B2FA;
	Sat,  6 Jun 2026 07:20:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57822253B0;
	Sat,  6 Jun 2026 07:20:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730429; cv=none; b=sxCOhh8dGT2njCeoxh8fwYf0rAVFgxFg/o8vO/Ed5lnf8HkEu6TVDLLyIr+DCTXmlIwm8k26XfH1LfJoTgjselHn6Tsh4ZP9+YTIO4RIAFbQhlDoR8109T49DfEAzX1tHZz6k+vxX91eFzXMwv4mXPR1pJ5ScF+4Rw4W0oPZvJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730429; c=relaxed/simple;
	bh=YB2cR5AVk4YpTzDnqiM5TTTglr81HrF/neI0EmnMzKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CI68BxEicyqh80vymD/fb826RrGRvtZmIgEx5A7TMHZeEj7stf/wb+b6uTb/zTllQbaUat73d3bk92KUuF3J6JIq7gjLojxIYAlo+R3NaHd+7mtFvlBVMXFrGIfnyaX1gZ4ZfNLRHrzITDBeVfOm0dPH8CwYkZq+3Hg3yMiHRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6nlRls5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C65A1F00893;
	Sat,  6 Jun 2026 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730428;
	bh=RP3mn0kdgyvLGaS9ImYD6iXJDSRSS3hCrPGPXerPjko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z6nlRls5EWvkEnt5P7sFbdZUGqVMF5ofUJ89h2vRgsZs1050GzD4+NBqgoEuBVFy+
	 sKJUa6UqjhsPIqgodXA8owCazflcz91Ss3o/JGqsWJo4bF4sYIueEYwkkcXu3csbDZ
	 FH4CEvaRn9iDt0UhX3YmzhAMWVmu9poWxC/6IdIuCT3/qO0JbTO/jivjYTmgcUGg8A
	 xWH8srU2sATgK/Ykp+eQ2wx4WtODbCJWt7LcEYT5mwkueoWZmedx70RxadfKEkF2A5
	 UAnaNCNybUBjsRWptdqxlR697m4QQzspAJJk9FTMBI+55yR0bGt/1eJzxMEX4Zq/uT
	 m10VyBQ8yM4qA==
Message-ID: <df293644-78ff-499b-bdfd-105b4e030c00@kernel.org>
Date: Sat, 6 Jun 2026 15:20:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] block: add a "tag" for block status codes
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-3-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260605184441.590927-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kbusch@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-91203-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 160D964CD16

On 2026/06/06 2:44, Christoph Hellwig wrote:
> The full name of the status codes is not good for user interfaces as it
> can contain white spaces.  Add the name of the status code without the
> BLK_STS_ prefix as a tag so that it can be used for user interfaces.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

