Return-Path: <linux-doc+bounces-41218-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B14CCA67C31
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 19:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECF3119C3491
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 18:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3BA1898FB;
	Tue, 18 Mar 2025 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAfDnhaM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3B7482;
	Tue, 18 Mar 2025 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742323532; cv=none; b=Ps25Lfg+Gu3lOLgaNOoG5vL3B9VeCUY4IC62oGHv4wp+/8T79ssgEhZXR7XYByJgJxBaxkc9j5BOLFrvjKSuCRgkszSKUErSUy5txo9wvS+vMsUhvq8BE+9uejy8JLB10noOJiW7ZQxqmH/plp7savmXNCGQF1RX8qMaCN13xVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742323532; c=relaxed/simple;
	bh=4yy5FV+NHxWjxQIzukU/Se754n09e7Jy3SESpaONoEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXcl2/qdr4h8q7iQwmoUQidjp5zAfHsFtvXB8thbqFDwLmMbvc/p5x9sVmETEF4jhKSV4wkNdbxdly8QXgatPSL3aVEGZ0kIxQLCNZImXccRdYh0L0T82JMlaHgf/s1SC9I/7v5T+ZuCaV4ciTvbWLA/iloTeOmMUTYLLG2/xV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAfDnhaM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15DEC4CEE3;
	Tue, 18 Mar 2025 18:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742323532;
	bh=4yy5FV+NHxWjxQIzukU/Se754n09e7Jy3SESpaONoEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MAfDnhaMubKIgA8mUwAhj93kp6Yi6QdJTznEGzH4v6YunDToeYPbSwCOpi/eVfBnS
	 iouc+9mcTaByLz3Nrsad9VcGN8U7SRwUeFgJCSk5DFnplGtk45Zyx6XNULqgVpUFMB
	 um/n/RhLOjS7eABxRZrLVL/PTmoHMrDbjhC7hYDa2R0nAWVLx8MOgCXrJqlmJpWNUW
	 hgm9+Tg7A+QnXoRCsccAq4c0dya12U6+3CwJPnexDMlTRkb7qaaF/bFDhX8g7se08+
	 JdsDg+LdehDBcKdCEEn6TR6w7BfqOLGJxGdibosIel11UOwdoMubdNLyM/33z2cKRr
	 g7s95guEMvSuQ==
From: SeongJae Park <sj@kernel.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	damon@lists.linux.dev
Subject: Re: [PATCH 1/2] mm/damon: implement a new DAMOS filter type for active pages
Date: Tue, 18 Mar 2025 11:45:22 -0700
Message-Id: <20250318184522.35292-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318183029.2062917-2-nphamcs@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 18 Mar 2025 11:30:28 -0700 Nhat Pham <nphamcs@gmail.com> wrote:

> Implement a DAMOS filter type for active pages on DAMON kernel API,
> and add support of it from the physical address space DAMON operations
> set (paddr).

Great, thank you for this patch!

> 
> Suggested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

