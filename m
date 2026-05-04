Return-Path: <linux-doc+bounces-85731-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE9POYAC+Wkj4QIAu9opvQ
	(envelope-from <linux-doc+bounces-85731-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 22:33:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C34C38F7
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 22:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFAE830262F0
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 20:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092BE30FF31;
	Mon,  4 May 2026 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KSvaHFxL"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E34317148;
	Mon,  4 May 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926768; cv=none; b=oynhWaIOru2QAROmBI1OuZi387r9pQAB9BY0QVmnHjTS6HITHdCDDGCzU1nvW0awvhEOO60aK9AHqowKSsdy8y9/rUXyemf9CNqmDMCORoVaOY8Ar5nYzlrsqfkYTUz0ZAgnVGlR2U0N9QnVkqXbU6zMnEmH8NAhswqESM+rddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926768; c=relaxed/simple;
	bh=wEH/+lS0JicHkpdDgkMtEnUlHf1L2YTeXBhpUlqkJGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7qdL0sqAvhjRQKCPFLmv3DdrBQb0fLzoze0l7eGsmBn4RLMuMIkhJFs3a4LvKntJIplUfaxBi66o3kKZkNRrq+DxNtNasWFPsvb+nuZ7JSN0nGtxzvzqiGF2aXKNEjEafdXrNR4m84hroiUmTp9uFcwHOcPvTdBwtEOdIcZY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KSvaHFxL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V8IJ0XLiNUSdII4ZYGeMeYsOXFzkpTWAB5nfUHMUTJQ=; b=KSvaHFxLwR6VTX9keDbXdE2hDJ
	LcU/HmUI1j+39WRIZKFG8wnm7lYCbZmxzflG8arBNkzQHxVjqaJ8VgIwfIn2g6l4XNjvHjbaLUJSi
	OySLEt8kXA+JbNl1MrRg8l6MwhlN5+3PUiKgbtNmIV9NiegVg2g2dddWmyKbYVd4LaSpss9pevlU1
	MugUXUuMYap1Me1DgPuj4KgL/rFPjgTeN3zwtPNAQple3ee3QIU4MmuyTUTdmkXaU2+IJsE3SeJ3/
	aO39NHoGMkR9bM7niMlhyYbgRb1vX+z9o3NauZ1GRnUDAFOsW6K5yYOa2oA+wdWXGezneRwWUWxlt
	ixg8n/5w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzy3-00000001TtN-0mDK;
	Mon, 04 May 2026 20:32:39 +0000
Date: Mon, 4 May 2026 21:32:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] Documentation: maple_tree: Point out constraint when
 using xa_{mk, to}_value
Message-ID: <afkCZkHcn58S3GLD@casper.infradead.org>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-2-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504165746.1422057-2-weilin.chang@arm.com>
X-Rspamd-Queue-Id: 625C34C38F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kvack.org,vger.kernel.org,oracle.com,google.com,gmail.com,lwn.net,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-85731-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,casper.infradead.org:mid]

On Mon, May 04, 2026 at 05:57:45PM +0100, Wei-Lin Chang wrote:
> Using xa_{mk, to}_value when storing values loses the information of
> the top bit from the left shift, point that out in the doc.

I don't know if that's necessary ... it's obvious when looking at the
function:

static inline void *xa_mk_value(unsigned long v)
{
        WARN_ON((long)v < 0);
        return (void *)((v << 1) | 1);
}

and if you ignore it, you'll find out.  But if this needs to be
documented anywhere, it's in the kernel-doc for xa_mk_value()
and not in the maple tree docs.

