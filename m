Return-Path: <linux-doc+bounces-938-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 752877D4FB3
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 14:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FEA281690
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF76748C;
	Tue, 24 Oct 2023 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jEMUTvg3"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C333DF
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 12:26:33 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBABA2;
	Tue, 24 Oct 2023 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E1uJiQP/0ZbFuPQlvGkRtaII5wIDYiIztvXwmZQ2noc=; b=jEMUTvg3FQ1RTd795OQ7ZOVoRc
	lHxEUt7t+evSaJwEBwlWiPrPrtYmQy/OJ6GkILGT0QliPAENo6l8f0tNI3ujocQv83odmqEF0edIq
	qP2whhLqAuPyl4o0OV3kkCh3ZAkiF1wcmH8B2fa10iP/xGkEwKFcBDtqr8VmfzZSH/tlNyc6QbJlP
	Wihkaj0KVhs4RqCDKs+AhZaTWh8JY0PEJk5V1C2jILuUDpi4fDztmg6DzKpewOT3P7F2qLEW6EizH
	MmqBwU72A2zbi25qZQWneB9aF5yGEtShr2c2F3d3A0qgGexRajO0x+GT5TrRH7BbyCMiKA6+LmyKH
	HMDQEyLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qvGTw-002RRU-44; Tue, 24 Oct 2023 12:26:00 +0000
Date: Tue, 24 Oct 2023 13:26:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 0/6] Delay VERW
Message-ID: <ZTe32IOvhBNkIlKa@casper.infradead.org>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>

On Tue, Oct 24, 2023 at 01:08:14AM -0700, Pawan Gupta wrote:
> Legacy instruction VERW was overloaded by some processors to clear

Can you raise a bug against the SDM?  The VERR/VERW instruction is
out-of-order alphabetically; my copy of Volume 2 from June 2023 has it
placed between VEXPANDPS and VEXTRACTF128.

