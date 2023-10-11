Return-Path: <linux-doc+bounces-72-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5807C52A2
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 13:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB7F1C20DB5
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 11:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628FE1EA85;
	Wed, 11 Oct 2023 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="vH+QURGh"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2361EA66;
	Wed, 11 Oct 2023 11:57:19 +0000 (UTC)
X-Greylist: delayed 1146 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 Oct 2023 04:57:16 PDT
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF378F;
	Wed, 11 Oct 2023 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7HThHjVRjaAH3M5PNDjGoOnPbrAsZmPdBw6j8Z6DAOg=; b=vH+QURGhl7qJKCl73dZvEEy4e2
	BtbnXKO+Nf9Rl5Xo1hDz+AioHNOCTqN1aTamuPjvNfBWJR2N059mEiy92xojopCqJvsRrzZKHJWWT
	5r13HuKWgnmEBBO4meqTlArPTAE95YPB6GvXed7NNcK3+zEuCVs0yHpmEB96mChdVpz1DBelnMM+y
	UDuWC9+ja1UHLwu01OrB2Vmicgi3KtEXTg1rc9fjoFFUWwHWD85aDHNUS2KudOa08RtHYwDgWtn1b
	2/FBs5Ch/+nau2me+4sqcIih2qPGYEbXG5mvrIOQXVZXDM0yGCOmLfutY7E+xJtHj+dAp8A5tfLvF
	DuDT7vhQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53422 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqXXS-006uiT-2a;
	Wed, 11 Oct 2023 07:38:08 -0400
Date: Wed, 11 Oct 2023 07:37:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    Palmer Dabbelt <palmer@rivosinc.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
    Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>, 
    Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension
 reporting
In-Reply-To: <20231011111438.909552-2-cleger@rivosinc.com>
Message-ID: <548c87a3-d1a7-a6ba-64e6-ddde97da2ae4@crashcourse.ca>
References: <20231011111438.909552-1-cleger@rivosinc.com> <20231011111438.909552-2-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


  correct misspelling of "fatorize" in subject line

rday

