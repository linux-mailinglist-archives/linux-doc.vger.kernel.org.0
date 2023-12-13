Return-Path: <linux-doc+bounces-4989-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2E811DA2
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 19:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420D41F2137F
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733FF5FF07;
	Wed, 13 Dec 2023 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="sKKi+idO"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB5A095;
	Wed, 13 Dec 2023 10:56:33 -0800 (PST)
Received: from skinsburskii. (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id 74A6A20B74C0;
	Wed, 13 Dec 2023 10:56:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 74A6A20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1702493793;
	bh=txIReIOWTRs39u8OW5af/PT5Nn7b+8jE2eqzUZ8XWC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKKi+idOLhnITF/wkGrqC9FTWsyho05pam4Ov+NiMJUNOG9wdoVWzvhAzzVVbi0fM
	 iq0Sk46HTEoSPfC26F5n/XR5paRCRmarYFa0kFuxc1gAWLfNan2s1/Q+8P81MaF2gS
	 dZCAJ3GCca9aPvSLzvGvcG/K17vyv+y4Qc5dMZio=
Date: Wed, 13 Dec 2023 10:56:31 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Alexander Graf <graf@amazon.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, x86@kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	James Gowans <jgowans@amazon.com>, arnd@arndb.de,
	pbonzini@redhat.com, madvenka@linux.microsoft.com,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Usama Arif <usama.arif@bytedance.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 04/15] kexec: Add KHO parsing support
Message-ID: <20231213185631.GA14708@skinsburskii.>
References: <20231213000452.88295-1-graf@amazon.com>
 <20231213000452.88295-5-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213000452.88295-5-graf@amazon.com>

On Wed, Dec 13, 2023 at 12:04:41AM +0000, Alexander Graf wrote:
> +void *kho_get_fdt(void)
> +{
> +	return fdt;
> +}
> +EXPORT_SYMBOL_GPL(kho_get_fdt);
> +

Same question here (and in other places of this code): shouldn't this
facility be provided to non-GPL drivers as well?

Also a minor nit: "const void *" looks like a cleaner prototype here.


