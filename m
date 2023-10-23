Return-Path: <linux-doc+bounces-784-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D877D286A
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 04:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E62EB20C55
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 02:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBDA1390;
	Mon, 23 Oct 2023 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="f1QQBLuQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30C15A8
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:16:00 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDB8D41;
	Sun, 22 Oct 2023 19:15:59 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 35FD760A;
	Mon, 23 Oct 2023 02:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 35FD760A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698027358; bh=EsvZ/Rla1pxEbVIbWjMoKGCfc+E8i3JEDgnFTdW5bDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f1QQBLuQ1ppsicfqtMnF3BmhNKOHxrmsStmVy21RMjiQcNX32L+fESxWDBHw7cCkt
	 NDVq1Qw53ZONIx3AolkpI9IysMmO7M9Bqwe6uto5aqvjv2Q+0aH5Ypx7J3HfPIm+tb
	 ZkCr5kSVyKoJS17mi4pPwYJeFquwpbAXygvTBYRNHJt1vFLwZnMLMwrYXoW49/eRGG
	 HEFJZxSBcDj3Ju4hLxfDsmwZpFtTVWOSrvy2QSlcQl7pmjEAr6Fdlwnc0EAYkB4PLh
	 sunBFbdAIFoXK25tAz18ShmI/sCYKQuMnI0puo4Ie2mocHOYe+42qNpBu6Y7knEHVG
	 nMizskTjWlf+Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, src.res.211@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: replace my email address
In-Reply-To: <20231012130008.102174-1-2023002089@link.tyut.edu.cn>
References: <20231012130008.102174-1-2023002089@link.tyut.edu.cn>
Date: Sun, 22 Oct 2023 20:15:57 -0600
Message-ID: <87lebukrs2.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hu Haowen <2023002089@link.tyut.edu.cn> writes:

> The Gmail address will not be used often from now on, and replace it
> with the email which is more frequently accessed by myself.
>
> Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>

Applied.

jon

