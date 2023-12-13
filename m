Return-Path: <linux-doc+bounces-4358-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF98086A4
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 12:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F4A1F2265A
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 11:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D0D37D2E;
	Thu,  7 Dec 2023 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V2irPddQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7CDA3
	for <linux-doc@vger.kernel.org>; Thu,  7 Dec 2023 03:22:35 -0800 (PST)
Message-ID: <7066a459-33d7-42e1-a493-d6c89fe5c5b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701948151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cb4VzxVK91eLXSAhmzzWZfAL/A/PEiW5e8jadap0ozw=;
	b=V2irPddQriH6vWR3AaSXIKqHFuVR6AykAkBM6sgAkLtyapy8RJsff6x8Gx2CvkjWXaov/d
	/attKbJ5cxqVpDBgEM7RHnJRG4BXhZfBhEt2nC7ZbuPFDzDSNKXXvo+wbjV7L46k6BycD+
	3pI2EhCpxXHGhgFT466NesVk+c04AM4=
Date: Thu, 7 Dec 2023 12:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/11] block: Block Device Filtering Mechanism
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: axboe@kernel.dk, corbet@lwn.net, snitzer@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Sergei Shtepa <sergei.shtepa@veeam.com>, Donald Buczek
 <buczek@molgen.mpg.de>, Fabio Fantoni <fantonifabio@tiscali.it>
References: <20231124165933.27580-1-sergei.shtepa@linux.dev>
 <20231124165933.27580-3-sergei.shtepa@linux.dev>
 <ZXF33Q9TpF4kBXP0@infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sergei Shtepa <sergei.shtepa@linux.dev>
In-Reply-To: <ZXF33Q9TpF4kBXP0@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


Hi Christoph.

Thanks for the review this patch set.
You've given me a good deal to think about.

