Return-Path: <linux-doc+bounces-49674-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA7ADF93E
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jun 2025 00:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91934A0DCB
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 22:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3C421CFF7;
	Wed, 18 Jun 2025 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZHKvFStG"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597821E08A
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285005; cv=none; b=BrbJid0D71aMH/cdhEaSoBFFJgBMnsTKuLqMRNxf72BkASWGAw6k3/XbEg46AixaCATnJwXB0Xqrrob0Kmt7zf38a7+Wug5nnupp2IPfuslG2m3ZHDT2iiNQhc1abUBiIG37ZKgWtvCf8eshASlde0kxPxjZEZXe4J5j4jOZ+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285005; c=relaxed/simple;
	bh=2BbbxRmtqOVCpf1GH9/ixch+btIorrBo2+d+I2WVHb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWPCxeb4OftJeWC2NcQaSXaW8tHAbEMd/iIncIpGbLSpHcoubZcQDrGNsq0pGLD0atpJ4C491GRAhDiNhKd3AvZlmCKs1jw7Td23pMHVrpOrZHQYIUtgDxq0S7ShR6X9T+/WPFtBgeICUyDTN6sHSGbhrDbUiMlDlQNFUTB+wRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZHKvFStG; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 18 Jun 2025 18:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750284991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dgwAgdJLrzXpgQ8D6Hgt0YJXNjToK14BuSNUeTn46ZY=;
	b=ZHKvFStG6UgUbbHHx+5PX6pI+BswfolXRlhw7k1HZjjKigB/FxOafqS8HBY1Kcg0kbsIe1
	MrRjUvIxZsq9aoDZDc03Bxqqp8gFRnSzm/F34IpXyKxPeC7HodrNUsbuT6InfpV8sF8JuP
	PsNsDYGyNrrqVR4rFmqiOZ+gKFanLbY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Casey Chen <cachen@purestorage.com>
Cc: akpm@linux-foundation.org, surenb@google.com, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, rientjes@google.com, 
	roman.gushchin@linux.dev, harry.yoo@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, yzhong@purestorage.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Message-ID: <cvrr3u7n424dhroqi7essjm53kqrqjomatly2b7us4b6rymcox@3ttbatss6ypy>
References: <20250610233053.973796-1-cachen@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610233053.973796-1-cachen@purestorage.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 10, 2025 at 05:30:53PM -0600, Casey Chen wrote:
> Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> Previously, each alloc_tag had a single set of counters (bytes and
> calls), aggregated across all CPUs. With this change, each CPU can
> maintain separate counters for each NUMA node, allowing finer-grained
> memory allocation profiling.
> 
> This feature is controlled by the new
> CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> 
> * When enabled (=y), the output includes per-node statistics following
>   the total bytes/calls:
> 
> <size> <calls> <tag info>
> ...
> 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
>         nid0     94912        2966
>         nid1     220544       6892
> 7680         60       mm/dmapool.c:254 func:dma_pool_create
>         nid0     4224         33
>         nid1     3456         27

I just received a report of memory reclaim issues where it seems DMA32
is stuffed full.

So naturally, instrumenting to see what's consuming DMA32 is going to be
the first thing to do, which made me think of your patchset.

I wonder if we should think about something a bit more general, so it's
easy to break out accounting different ways depending on what we want to
debug.

