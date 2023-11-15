Return-Path: <linux-doc+bounces-1752-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98B7E2D39
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 20:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1053280A0B
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 19:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C792D054;
	Mon,  6 Nov 2023 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q8/sBS6A"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32732D788
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 19:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBBBD45;
	Mon,  6 Nov 2023 11:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=f94JPRBiAKH4bv0NOHWLWcrjSw/yWsvyMGtRiVM5Wj8=; b=Q8/sBS6AHUKIctzYnVZm04uavu
	SYF8NSxXHC972Jcsqdy5S4w7xpwUEKgKME6NDbATjzoWC70WHzuSgYv/dRsSgRo8tjq56+KTd+xd1
	9NQg/e46gHBqcM6MzkPa7yaLEpgy/rlgFcamN7yOU0pxlZpwfmuI6vCI2hr2x7/porkoBxf+6sx4i
	mp/gNgRNE0GQLtd7VwgSdx3o2j/5Zv9msH/CUXly7yCRluz9np19PhHwawcrh1XyHHI7fz0KmVUSp
	f8J24mtxNayL0XPJE7to+5yPM0KJFjXO2+Q75iYDzBUrX/1VdrvAvM185U1FO0/5Wal3tJDNIgRe6
	bwY/UmNg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r05cQ-00HQ9y-2w;
	Mon, 06 Nov 2023 19:50:42 +0000
Message-ID: <b4354d60-7b24-4e36-b62a-515e8996334a@infradead.org>
Date: Mon, 6 Nov 2023 11:50:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation
 warning
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Linux Documentation <linux-doc@vger.kernel.org>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
 <ZUigbshGGc451V5L@debian.me> <875y2f193t.fsf@intel.com>
 <irp2myv4jp6o7vut5m7ax4hya5764xzustf2klxfpys42qmevk@yxxus464hito>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <irp2myv4jp6o7vut5m7ax4hya5764xzustf2klxfpys42qmevk@yxxus464hito>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/23 11:06, Hunter Chasens wrote:
> First, apologies to Jani Nikula. I accedently top posted on the other thread.
> My email client is giving me a hard time. The following works and, if 
> everyone agrees, I'll send out a v2.
> 
>  * E.g.::
>  *
>  *  S: 19Mhz *
>  *  0: 615Mhz
>  *  1: 800Mhz
>  *  2: 888Mhz
>  *  3: 1000Mhz

Please do.
Thanks.

-- 
~Randy

