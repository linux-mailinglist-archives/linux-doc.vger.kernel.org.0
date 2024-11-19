Return-Path: <linux-doc+bounces-31157-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9F9D2F3B
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 21:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960451F23C61
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 20:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D3019C54E;
	Tue, 19 Nov 2024 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcK2Virb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE8153835;
	Tue, 19 Nov 2024 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732046595; cv=none; b=AAjPNyqy+uiJRy6bOnvPl5fn9OrDKNAC5bH3yrV6CVFqJ+/F7FbFfrvmXHidE5Y9Eo88I5Ez+iO/AESY0wQlp2q70eG1hRUQY5TxsciVm9gy9Wa5AYQ/ScHABGXG/2HzaeOEfCyJV4+D3TYaR4iKKpM2zDiXH5kgoMSUjJGJ//w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732046595; c=relaxed/simple;
	bh=x1RdSN7LBYte/B0a3iRmsBYAZ8psigzEvbDsszkvYB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nds0t9hnf5cvVgG28zRnk6cZ+0Q7JKpV9WtE45xb4rmp/tZF7MBMhMx+JUB8TxHZwouxq2eopB/d3U7JFYJ1wSYHI0CWNM+wNmsZPUkmKNmZws5L0OrY7/X7vjzkTGbOuX0iCkhuqXZ/2FRfSTwi7Om2dAk3Y2AQpWJaJtnpOBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcK2Virb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4954C4CECF;
	Tue, 19 Nov 2024 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732046594;
	bh=x1RdSN7LBYte/B0a3iRmsBYAZ8psigzEvbDsszkvYB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcK2Virbs439kHEoFZk7V3Wu1TLC3v0HVvrd+BYrOGKnkwjjbXG+l0i51z1gy3s5f
	 e8ns2v0bdJOrY6QK6s81LhUakCe1eWqgFfqb4Q9pS69IfrACXUAoFFc3twAoyiuON+
	 ywuKOJVYOT23cENBf5UzOEMsgNqwYKVMGIUFpzoBxKLT87BqyzwzrUub2vNdHeEdBJ
	 Tb2QsnL4zz5V0CDGAkjoqVFFQE2+Bzvxh9fnXrH2+iWJlWRlQxuefTKDyy8kz9BhdO
	 ZMPtLYhJij/PpkivekUqzLEq4ZfRQLoTucE99DmdDrMqNvFFmpEzyQhCR3eoI1pvvj
	 nNhAW4cXW4nYQ==
Date: Tue, 19 Nov 2024 12:03:12 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, corbet@lwn.net, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com,
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
Subject: Re: [PATCH v6 00/15] integrity: Introduce the Integrity Digest Cache
Message-ID: <ZzzvAPetAn7CUEvx@bombadil.infradead.org>
References: <20241119104922.2772571-1-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119104922.2772571-1-roberto.sassu@huaweicloud.com>

On Tue, Nov 19, 2024 at 11:49:07AM +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> v5:
> - Add new patch to introduce ksys_finit_module()

Why?

  Luis

