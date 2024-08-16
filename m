Return-Path: <linux-doc+bounces-22984-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C4954E0E
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 17:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CFC81C22879
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22CD1BDAAB;
	Fri, 16 Aug 2024 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o8BVWbV2"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4501BDAB5;
	Fri, 16 Aug 2024 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723823073; cv=none; b=B3H7rjRLe7afw8vzDWPio5Oa3tfEbJnS4c/24oolp+vpLA0RRrIDNxf41q4SRuxlMy8hx/DKXsjfunVH8gleIFO0IuE8ZA+qkLqOaXl/k27ckQoMYI2UqJJuvJH+PJ0eEQwzFUzEZzUd1HVweQWrpkynHkx0owveCbZtoe6ntUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723823073; c=relaxed/simple;
	bh=KOTIU21F5fyuTV5MN3PTTpuJ+JEbCQXr9Fl4lQaTqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKEqe7COB89vB0d69q4RUgns8dGPvjnr9hljhcKUpL+c5Hwf32g+MjFG6vGjkmNf1v17EW+a0HcnX9xodhz3Q+TSHBrSVP2W1bMPfzwpjggaYn3920QFqv2yFiU9vC5UD0pQc7B+KajJvXCeMUw/SKAVLo4MBOP5eKjrPjrkYxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o8BVWbV2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tgmySbRwp3I0v4k+W+elsCxx/kQc/3jwf7sA3HlVR7E=; b=o8BVWbV2qPTU0QptJvu+e5wG2g
	vZWxPPmF+etUOMaJeF4OEbn2tBGjPvBT2KkkZ089V9vh4jcBnju0+V6YXMns7tBwJttNpPuN7OYoO
	/m3b/GT3XBzV4UcktvdRqKOQ7+el+CYIY9Ep3RN0DObJqEKA69Mdw3wid7QfhLTgx8gyXrDLmDHeZ
	2++oQtMglbMSXqUsqYTqiPo9gIoSW4xtI8PSWk3HeETkH1RgFcLhBAvrlakOdyziwQrNgJnn5s5XP
	Ta0lzB8CSVymbMA6oEkMwXcvLg+BkPviW43ai1H5bzTt16qYqUBZ5tZzR63jbxX4/at0nE7VcWA6P
	iRy0XdJw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez7X-00000003lSD-1DSr;
	Fri, 16 Aug 2024 15:44:07 +0000
Date: Fri, 16 Aug 2024 16:44:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hannes@cmpxchg.org,
	riel@surriel.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	yuzhao@google.com, david@redhat.com, baohua@kernel.org,
	ryan.roberts@arm.com, rppt@kernel.org, cerasuolodomenico@gmail.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 4/6] mm: Introduce a pageflag for partially mapped
 folios
Message-ID: <Zr9zx74W6-oRwKXB@casper.infradead.org>
References: <20240813120328.1275952-1-usamaarif642@gmail.com>
 <20240813120328.1275952-5-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813120328.1275952-5-usamaarif642@gmail.com>

On Tue, Aug 13, 2024 at 01:02:47PM +0100, Usama Arif wrote:
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index a0a29bd092f8..cecc1bad7910 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -182,6 +182,7 @@ enum pageflags {
>  	/* At least one page in this folio has the hwpoison flag set */
>  	PG_has_hwpoisoned = PG_active,
>  	PG_large_rmappable = PG_workingset, /* anon or file-backed */
> +	PG_partially_mapped, /* was identified to be partially mapped */

No, you can't do this.  You have to be really careful when reusing page
flags, you can't just take the next one.  What made you think it would
be this easy?

I'd suggest using PG_reclaim.  You also need to add PG_partially_mapped
to PAGE_FLAGS_SECOND.  You might get away without that if you're
guaranteeing it'll always be clear when you free the folio; I don't
understand this series so I don't know if that's true or not.

