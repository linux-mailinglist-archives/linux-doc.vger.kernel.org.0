Return-Path: <linux-doc+bounces-31112-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E036F9D2557
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 13:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5AB128268F
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 12:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4E91CBE9F;
	Tue, 19 Nov 2024 12:14:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F01C727F;
	Tue, 19 Nov 2024 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732018451; cv=none; b=XFVGMr14LJxzrQEYSEgZSRb2zpWYgBxAk0ZY92NtHhVJ2yVA12dbBlwPDCdkqvEZOENx9laUkuBdQTc6/KDtxErUYuhUUK3WR1UuVjsFHHFfohHxrnMdLIe2IA+qlo4AERoKa4LLCVYGeVsJFKauHJqyL6zyFPfGpgGMcrvU4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732018451; c=relaxed/simple;
	bh=hsYhvmk0aKJM5AJfAA2jL50OE6T6vOaVIXRzJtp152M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKfL0rh0Jc/UqkxFIRWAj85RK3xQI0q9ChixijsZPlwqsHB/WQsguTsfFR6YCy40amMszXNeqOs/gu0fe3PlB1oijc1R9r/F/btLi1kbVNaJKvdli80BfyyiDB1dWMLd+FehgxOibdEsPZX1ISoejCMnaqr3RrKyHRVQ8wCE15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C740168D80; Tue, 19 Nov 2024 13:14:02 +0100 (CET)
Date: Tue, 19 Nov 2024 13:14:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, corbet@lwn.net, mcgrof@kernel.org,
	petr.pavlu@suse.com, samitolvanen@google.com, da.gomez@samsung.com,
	akpm@linux-foundation.org, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, shuah@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, wufan@linux.microsoft.com,
	pbrobinson@gmail.com, zbyszek@in.waw.pl, hch@lst.de,
	mjg59@srcf.ucam.org, pmatilai@redhat.com, jannh@google.com,
	dhowells@redhat.com, jikos@kernel.org, mkoutny@suse.com,
	ppavlu@suse.com, petr.vorel@gmail.com, mzerqung@0pointer.de,
	kgold@linux.ibm.com, Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v6 02/15] module: Introduce ksys_finit_module()
Message-ID: <20241119121402.GA28228@lst.de>
References: <20241119104922.2772571-1-roberto.sassu@huaweicloud.com> <20241119104922.2772571-3-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119104922.2772571-3-roberto.sassu@huaweicloud.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 19, 2024 at 11:49:09AM +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Introduce ksys_finit_module() to let kernel components request a kernel
> module without requiring running modprobe.

That does sound more than sketchy, even more so because the commit log
completely fails to explain why you'd need to do that.


