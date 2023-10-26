Return-Path: <linux-doc+bounces-1224-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2787D87D0
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 19:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC0B1282111
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 17:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238A038FA5;
	Thu, 26 Oct 2023 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zv4dnmKd"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47913717D
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 17:50:17 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF358B8;
	Thu, 26 Oct 2023 10:50:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47DC436E;
	Thu, 26 Oct 2023 17:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47DC436E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698342616; bh=EqKA0JXgmnBKYcsb+SfmiAaHk9DpVeGJdzXgW+CLOO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zv4dnmKdWlXU3j22mUXRphnyNf9Wcp+wS+0E6hmMj9PkcjraZesBi+26W7Z9KE7++
	 L2y9EJmY9TtQmKJsn+deMumtxTxLvOvzJVNF4mX+2MRBulhnFAPtp0IB/DutFEZxI2
	 N0pRTmly7469nwsRiC/DM6wWrL1RvKcSKE1ftnNOUf9gxGOGkB66KR05ZGjIDpPcxE
	 hSOfhso5VyQUnJdSCyrV0eSfgLyL6X2cLHjkdGmJyGYEF07wzySRdvAcmsmfj/KvHC
	 5KnFJUPH1tojPOJvoz1tTauWQsFngZyd2l5UMKmLd0G/tkSBjxU+SyHOWmSWftdJ6b
	 FEIVi9C3a0ESw==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Harshit
 Mogalapalli <harshit.m.mogalapalli@oracle.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Willy Tarreau <w@1wt.eu>, Ben
 Hutchings <ben@decadent.org.uk>, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH v2.5] docs: backporting: address feedback
In-Reply-To: <20231023135722.949510-1-vegard.nossum@oracle.com>
References: <83fd1a05-974e-4d91-82b0-c09cc2f8da1e@oracle.com>
 <20231023135722.949510-1-vegard.nossum@oracle.com>
Date: Thu, 26 Oct 2023 11:50:15 -0600
Message-ID: <877cn96zoo.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This addresses a few comments/issues in my v2 submission:
>
> - repeated word: 'run' from kernel test robot
> - emacs/ediff mode from Jon Corbet
> - various comments from Willy Tarreau
> - more backporting advice from Ben Hutchings
> - a couple more cherry-pick tips from Harshit Mogalapalli
> - add a bit about stable submissions
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/process/backporting.rst | 152 ++++++++++++++++++++------
>  1 file changed, 121 insertions(+), 31 deletions(-)

Applied, thanks.

jon

