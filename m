Return-Path: <linux-doc+bounces-1220-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085A7D879A
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 19:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C70281FCE
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 17:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40875381DD;
	Thu, 26 Oct 2023 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WjlT0kpr"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CA1BDC7
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 17:33:58 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7348DC1;
	Thu, 26 Oct 2023 10:33:56 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 05FAD735;
	Thu, 26 Oct 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05FAD735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698341636; bh=x58EWngCurg6BZuzfeiK9njHyHbP6dkg4xxTox6g3GQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WjlT0kprjMdxOpD6IYawOkrnRKrDgKM+jKnE9/K2bI4rn5GSNGIbv6P/cSTiOyrWL
	 wwrOIf9WRnjLwG++XlBwleUpx1jUwsFzW418Ow+nX1X3bZETJWuTlnfCYc38S4BG3L
	 QhEtW22Pra5bRsTel0GAUQvcbn3D9g4RxhbGUsrb0hJqIyyewUP/breSOhDXLdN7iN
	 A95OSzvreDaAou1gmrCKjFuAEhKfmBmDrCPPDXJTIa2fMztc3964aDe8sYXtZ4vAHI
	 HD3fiYB84yqX3FqNjbc7/TWPTanGLKpeO2kEPjlx0BlEd6C6cxsYF7bbfz3Z0kmRS5
	 Lovh4dHr+ijuw==
From: Jonathan Corbet <corbet@lwn.net>
To: Tang Yizhou <yizhou.tang@shopee.com>, houtao1@huawei.com, jack@suse.cz,
 bvanassche@acm.org, kch@nvidia.com
Cc: axboe@kernel.dk, tj@kernel.org, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yingfu.zhou@shopee.com, yizhou.tang@shopee.com, chunguang.xu@shopee.com
Subject: Re: [PATCH v2] doc: blk-ioprio: Bring the doc in line with the
 implementation
In-Reply-To: <20231012024228.2161283-1-yizhou.tang@shopee.com>
References: <20231012024228.2161283-1-yizhou.tang@shopee.com>
Date: Thu, 26 Oct 2023 11:33:55 -0600
Message-ID: <87jzr970fw.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tang Yizhou <yizhou.tang@shopee.com> writes:

> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> Our system administrator have noted that the names 'rt-to-be' and
> 'all-to-idle' in the I/O priority policies table appeared without
> explanations, leading to confusion. Let's bring these names in line
> with the naming in the 'attribute' section.
>
> Additionally,
> 1. Correct the interface name to 'io.prio.class'.
> 2. Add a table entry of 'promote-to-rt' for consistency.
> 3. Fix a typo of 'priority'.
>
> Suggested-by: Yingfu Zhou <yingfu.zhou@shopee.com>
> Reviewed-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
> ---
> v2:
> Accept Bart's suggestion and rename the title of the patch.
> Pick up Tao's Reviewed-by tag.
>
>  Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

I've applied this, thanks.

jon

