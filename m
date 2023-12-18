Return-Path: <linux-doc+bounces-5480-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C481780F
	for <lists+linux-doc@lfdr.de>; Mon, 18 Dec 2023 18:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 360EC284036
	for <lists+linux-doc@lfdr.de>; Mon, 18 Dec 2023 17:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7754FF98;
	Mon, 18 Dec 2023 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KtuS8UGL"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB944FF7B;
	Mon, 18 Dec 2023 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8ADF737C;
	Mon, 18 Dec 2023 17:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8ADF737C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1702918906; bh=nWOl2BY1xyRe8NenSZAbx+ziUsCvyZA9iGWBdQbhSVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KtuS8UGLDzho2qAfB3q1nCt2neiQV8leUpSgH2aZhiZi4jtqA99rq7rTNXcErgTyJ
	 KqSbW63JqGNhllYAcCtg8urPATdYzAIMg80J4BQMZMTZNfIheP9B08WMm4AR55e+15
	 fIjlv7ntrffdYYiCFGGxr1VOzFga6Sb16F7vn4EWqTN1SUDaXPhekQGfhYiYuFswf1
	 VTfN5uFdx8X815ht+cF9OvjDOevWzR5OBabKdR3dOxTBxXztsC5QR/+C2JAVvW8gri
	 K4fBbKyzqba+zQDyqaEFbw65p/P/GIj0oU26Qrlcz+tim0wB6rHZ9ccWkHz1Y4DZFc
	 KFqFNKarrVo2g==
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao@amd.com>, Avadhut Naik <avadhut.naik@amd.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, avadnaik@amd.com
Subject: Re: [PATCH 0/4] Spanish translations and corrections
In-Reply-To: <3c72323d-b3e1-46a9-a462-c1986667cf7a@amd.com>
References: <20231211023730.2026204-1-avadhut.naik@amd.com>
 <87il4zqwvv.fsf@meer.lwn.net>
 <3c72323d-b3e1-46a9-a462-c1986667cf7a@amd.com>
Date: Mon, 18 Dec 2023 10:01:45 -0700
Message-ID: <87a5q7moli.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao@amd.com> writes:

> Jon, Avadhut has helped me so much this last year. I would like to ask you
> to review the patch below so we can include him as reviewer of the
> Spanish translations of documentation. Sending separately too.

Happy to add a reviewer!  Avadhut, if you could send an ack to the
separate patch adding you, I'll apply it forthwith.

Thanks,

jon

