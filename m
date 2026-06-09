Return-Path: <linux-doc+bounces-91544-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bFvmI8jEJ2pb1wIAu9opvQ
	(envelope-from <linux-doc+bounces-91544-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:46:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7A65D5A3
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 09:46:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91544-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91544-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 371B63009389
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 07:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D660C372EDB;
	Tue,  9 Jun 2026 07:46:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA2226CFE;
	Tue,  9 Jun 2026 07:45:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991163; cv=none; b=OBzuk7azsVd7lLIacE50gYqSqhPZkuZ8b2g7uil+Ba8tYGSLlKD0iuyemE6tIJ7dGz7OyuJQXLOtFAsW4gszafYwmRFdn/xAJH0+bxQeKoLJGk9uGupVrEIcOP0VbrwOCTIHbxK2M6+Egzm+BtobD+/V8MZcxrAhUpOorv1tk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991163; c=relaxed/simple;
	bh=pz9yiqDjBu9r2Wei3+P7L8usowMFyLxDI0wN0AsaewU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDM60E8uFqPxmY72j0FGE0PNjPuwwUJz+6GjVFD3Bdh0JC2rpO+5KtPo2BnNZ+9ylDzJnp7DqolX1N7G3tmmgd0GqwWql5iUOLUDuWjay8WUsUcK6IH922aDReej7oEZWbt0qumO/WbKuObVWCNM5KSihz8DbxO+Q4lFToZ2N8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7465B68B05; Tue,  9 Jun 2026 09:45:47 +0200 (CEST)
Date: Tue, 9 Jun 2026 09:45:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH 3/4] block: add a str_to_blk_op helper
Message-ID: <20260609074546.GD6877@lst.de>
References: <20260608051416.1205282-1-hch@lst.de> <20260608051416.1205282-4-hch@lst.de> <5e738f79-e1d9-4224-ae85-322967682a1a@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e738f79-e1d9-4224-ae85-322967682a1a@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91544-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6F7A65D5A3

On Mon, Jun 08, 2026 at 02:57:40PM -0700, Bart Van Assche wrote:
> On 6/7/26 10:14 PM, Christoph Hellwig wrote:
>> +enum req_op str_to_blk_op(const char *op)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
>> +		if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
>> +			return (enum req_op)i;
>> +	return REQ_OP_LAST;
>> +}
> The above function is similar but not identical to
> __sysfs_match_string(). Is __sysfs_match_string() good enough in this
> context?

__sysfs_match_string exists as soon as an array entry is NULL, but
blk_status values are not fully contiguous, so no.


