Return-Path: <linux-doc+bounces-17949-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B9900473
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 15:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E191F23976
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 13:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50150193099;
	Fri,  7 Jun 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gf/8G/fz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9B1422C6
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766328; cv=none; b=iPI9+GWrx2JVcDtuuACP1b+xHxCYJHsKI1BVvcLogw33wLLzveZEjZHtQ1FZWYE0lGWYpBNCiCGz8h6ldxUf6Vq2TNcqRG44Lyu+mhss735Lsmci54v6oOCEhKKZATK9RxF613H4rQgEbHiHqYoblYpDF8sxwt3Wd8vHlrXQ3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766328; c=relaxed/simple;
	bh=nxrhpfJSNSOyp/3P/72Vc5v+qaFes7O1pm1nHMhjYDc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB73Bjyze8Y4UhScxqxdv3rPfpifSGVYCWHK6iprFYFj6mbakRo4h2bGgeCeux3bfqOOdG5xylJooow2dohHekKor0mm/RswUPG9da7YvdFUPWnu/UIisE5TxzDeNLgOcTl/WXkxK0gKobyIQZTDgFQsDu/3NC5yBx7BoVkO7vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gf/8G/fz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so24552681fa.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Jun 2024 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717766324; x=1718371124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNOtY9kbCwarj0NKj0Q/xsdwvI1gsG+x4nJEIzhwFBs=;
        b=gf/8G/fzWqOlKvRriGjReem4l5AXOoPsaUxt3IW/kb4CSZUBp+9Y1wkpLIPIvi3mDk
         nJr5wmMwbaF4MUWpLY6gDG2N+ABPBVou3Tyst4cEp40tTvAzKC8/3lc1xdzYpp5MC6H5
         9W14vcalpgTPdni3VNLQTAPQfBBmpghzVoTxDmxuZP1KacVUpA3YC3x3EbKqGgcHGVey
         ilkWpKbqAiuih371FW72noJDMCsYk+33SwQINTM1JHy93XNK5mKtBE2kWNti+1VSEcFW
         BguTf3i3Np3W0QVzajdjXDPVvC/hZkcK6qY/NM4dWfXsGXo97MK+gFp/SLp8z1b7VmjI
         wAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717766324; x=1718371124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNOtY9kbCwarj0NKj0Q/xsdwvI1gsG+x4nJEIzhwFBs=;
        b=WnNJEbU2aIBHebxpI7mzR9qcCN0SDTvsw4kg2W9/4Ef8cKn03QA5WbUVseqsPLg5mg
         4gt3rVekcBdiXfCBHpfsTD/UJgH+ES9lR5qkKC/FIqCWjQfdyNxKoTCGU/TybA/ujy33
         rP5/jKPtC5QnjiaWT+ScLJUkFQiBtAH40KB2GxehSdMtyLN6QoLUGnTpjBFGpK0TO2IZ
         j1Xz6F9F3MfLFlXgrFcipPB4Lnnl0yWSRo7fw2stXgBJlLxsdDVs64dkh3ugEb+hKz/T
         oCJZZx8/+S3sfCKkvSCXjWE0Kpl8oz/s/h4RXKVhurRwPK/8x5t/etz70OPbMN7sS80H
         1HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxm1THOxGfwrnLje2V93aPau2rx1WhrOrREqW5PVe3TRhWPhEL4GLaNIX9J5OYNWZwzTU6iulgjofpQu0NTNMX3UzayHEf6f5d
X-Gm-Message-State: AOJu0YyOO4CCIhcGt6/mNv6H++k2gyYpjKnJkumtW6Nmrloc5NAhqxGM
	oLjDcptCIRmj4+FYJMfJdeF0BNyrUj3sVdTcGlVaPeV4Y9Nx6fjaR5PVwI2Rhiw=
X-Google-Smtp-Source: AGHT+IEBxyjXDl9VEt7rh7TeIxG6bOvGA4j17IdvLoM+xGRwnhFMyvO9AhcxnCYNWTyb7vuvBSDlAQ==
X-Received: by 2002:a05:651c:550:b0:2ea:e12e:bee5 with SMTP id 38308e7fff4ca-2eae12ec074mr11738031fa.4.1717766324270;
        Fri, 07 Jun 2024 06:18:44 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158111143sm87617865e9.20.2024.06.07.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 06:18:44 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Fri, 7 Jun 2024 15:18:40 +0200
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 0/6] fs/proc: move page_mapcount() to
 fs/proc/internal.h
Message-ID: <ZmMIsJ4Yg2r9bT81@localhost.localdomain>
References: <20240607122357.115423-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607122357.115423-1-david@redhat.com>

On Fri, Jun 07, 2024 at 02:23:51PM +0200, David Hildenbrand wrote:
> With all other page_mapcount() users in the tree gone, move
> page_mapcount() to fs/proc/internal.h, rename it and extend the
> documentation to prevent future (ab)use.
> 
> ... of course, I find some issues while working on that code that I sort
> first ;)
> 
> We'll now only end up calling page_mapcount()
> [now folio_precise_page_mapcount()] on pages mapped via present page table
> entries. Except for /proc/kpagecount, that still does questionable things,
> but we'll leave that legacy interface as is for now.
> 
> Did a quick sanity check. Likely we would want some better selfestest
> for /proc/$/pagemap + smaps. I'll see if I can find some time to write
> some more.

I stumbled upon some of these issues while unifying .{pud/pmd}_entry and
.hugetlb_entry.
I am not sure what is the current state of pagemap/smaps selftest, but
since I am going to need them anyway to keep me in check and making sure
I do not break anything hugetlb-related, I might as well write some of
them.


-- 
Oscar Salvador
SUSE Labs

