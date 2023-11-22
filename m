Return-Path: <linux-doc+bounces-2940-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E631B7F50FB
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 20:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05012813E1
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 19:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2FE58AA8;
	Wed, 22 Nov 2023 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from gentwo.org (gentwo.org [IPv6:2a02:4780:10:3cd9::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E312A
	for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 11:59:43 -0800 (PST)
Received: by gentwo.org (Postfix, from userid 1003)
	id 7418448F4A; Wed, 22 Nov 2023 11:59:42 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 727AB48F41;
	Wed, 22 Nov 2023 11:59:42 -0800 (PST)
Date: Wed, 22 Nov 2023 11:59:42 -0800 (PST)
From: Christoph Lameter <cl@linux.com>
To: sxwjean@me.com
cc: 42.hyeyoo@gmail.com, vbabka@suse.cz, penberg@kernel.org, 
    rientjes@google.com, iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, 
    roman.gushchin@linux.dev, corbet@lwn.net, linux-doc@vger.kernel.org, 
    Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [PATCH v2] Documentation: kernel-parameters: remove slab_max_order
 and noaliencache
In-Reply-To: <20231122143603.85297-1-sxwjean@me.com>
Message-ID: <5455742b-b287-fa75-d255-54f81456dba9@linux.com>
References: <20231122143603.85297-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Wed, 22 Nov 2023, sxwjean@me.com wrote:

> Since slab allocator has already been removed. There is no users about
> slab_max_order and noaliencache, so let's remove them.

The aliens are gone.... Wow lastet two decades.

Acked-by: Christoph Lameter <cl@linux.com>


