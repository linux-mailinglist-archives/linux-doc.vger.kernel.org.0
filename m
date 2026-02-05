Return-Path: <linux-doc+bounces-75282-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GLdDy/vg2mtvwMAu9opvQ
	(envelope-from <linux-doc+bounces-75282-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 02:15:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3202ED990
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 02:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51777300681B
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 01:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6147219A81;
	Thu,  5 Feb 2026 01:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pQ/xTFyF"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E728371
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770254124; cv=none; b=WBQQ9t6gVJ2twtcMWIaBIjLbIyYs1WvazeUR/rLP9AxtdWJBrVjNuot6cF8vVYGRIKtqQwQHspCTcLHeAZt6VYfPOG9aykdg8uPzmfX5SErEaTefUN0sQKn3r4Xq4cLxj46uai81rLOBVHJcWstP9pW8tY0wuJW1ad4WMDGENBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770254124; c=relaxed/simple;
	bh=9ZSFYM9VZ4oK1hQjLtZB+I9MVYbAaxxvSNJByCby+rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L15VCtHbDA7k+3y3LVgDjdRJLCb9OECldn5/Uw1tefJHOjihl6i1GW87PZfPjD5fhUTMjy7WgswgIcbMYwQzCsP0fEOFhHFFF5mP58NZgx/2UQVIm1aiwroZYhRP89Y11HEeBCiHktQP1e+UMyxwjBsEDcCWm9oMXWJNBGWpu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pQ/xTFyF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fzciBs6GhQsu/Vz0cvaYGhXbCWVxclkIIErpiKMxU7E=; b=pQ/xTFyFb1xYXouvFw7RM1k05M
	lKUEZQF6bZP429cDDJMJd/H/GgAuYFr3g6HA4JGigJqliRXKZCvOQfIKa+Tw2mTjVHLQFlQYqQIH4
	qCH/xtew7lfg11ERPzOFEHkDu9KyoJC0eq2Cqku8DBuQ5QDUw/mIvEDlN+/cr4SM25tnj1FZCuzKM
	cWQzGr1Q4KVByIoYdYsLsCYXf/ju351g4QM4R8mOF5qqN5barBJO8NxZ6lhqRdcG9M8n6BiQxZAzb
	45hIDZn9ew8+tcngeLNSKGZIVJMy1kp5rptWLPTdqvowgCXeTrSlyrPo2Z4DmMpZ4whlOjgEL0fII
	2oMH7gzg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnxp-00000009Ft5-3NJs;
	Thu, 05 Feb 2026 01:15:21 +0000
Message-ID: <761e2297-3481-4df6-9ec0-7fc6fd919797@infradead.org>
Date: Wed, 4 Feb 2026 17:15:20 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
To: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20260204113210.185221-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260204113210.185221-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75282-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: E3202ED990
X-Rspamd-Action: no action



On 2/4/26 3:32 AM, Daniel Pereira wrote:
> Introduce the initial Portuguese (Brazilian) translation
> for the Linux kernel documentation (HOWTO document). It establishes
> the directory structure for the pt_BR locale and adds the official
> entry for the pt_BR maintainer in the MAINTAINERS file.
> 
> Additionally, this version adds pt_BR support to the documentation
> build script (Documentation/sphinx/translations.py) to ensure proper
> rendering and fixes the documentation hierarchy to avoid orphan file
> warnings.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> 
> ---

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy

