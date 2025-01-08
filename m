Return-Path: <linux-doc+bounces-34324-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06936A051DF
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 05:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0232D167527
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 04:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D156619E826;
	Wed,  8 Jan 2025 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSG7Zfue"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648919993B;
	Wed,  8 Jan 2025 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736309370; cv=none; b=Q/tOxNp0G5JTUrEOYcHuoLg540SeCPawUtu1e5b69bazOmMOWd1vJP5LBzyyXuI4i+YAJIodEtSXr7va8o5nPzKz0RPka1AzjkLXmRTEcQRIjqFpql3Vi6ic55ggesp5P6E9dRh2PPVP/r6Xdr3eiCi/SlJwvDMYVAkLtoWNclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736309370; c=relaxed/simple;
	bh=kwYHf1QaDn6b/d3nlI30lAx2+BtkBHmu1/Da9mkb4zU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfiNGOqYl3fcRhSF3g5QZ7wCW1U0c1HjwYTbA1lOUhwaSCdcJy+F+0hSNQSYog3nH4IrXuQBP3ABMELaUpokXPDcKNHYBdcPz9r+82trruCS+41r9UYhVKJRN/DAA1O/jLGpud2z9tAZqL3OKoLKSmXnbBJTegGQ2Mz2/hkdV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSG7Zfue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB5EC4CED0;
	Wed,  8 Jan 2025 04:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736309370;
	bh=kwYHf1QaDn6b/d3nlI30lAx2+BtkBHmu1/Da9mkb4zU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSG7ZfueDxW2bJypOACK2z7+a/2WE7w5dlIs12mS4utWLGiIdBKF9Ol2v4rjWYfiw
	 532mJiVhlwkAX5Fz6JmDX4gur+t3Rj18f/pcc6W7DbLDpb72DAlkHRr1wMpN6LmAZa
	 +E7ne+65Eqx1vOhSHFE/xlZi8rEBfMKWkS92vevTtqBzP9rQGYki4rxcN/QheDSXIN
	 mUxNNDXQEbDwrQjkhmMhofWJBDw+CFP2SkDyCBJF5T+HiQh5yc9N/fA8ecVBnvsr/O
	 zh68W7WzRiSv7hNhmYYa9y/mbNlJJ4cen8k4u3Un0yX0vGdYpQqtekDGF2irQtXyY0
	 MqDyT4mIZ3SpA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/10] mm/damon: extend DAMOS filters for inclusion
Date: Tue,  7 Jan 2025 20:09:27 -0800
Message-Id: <20250108040927.1368-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107201739.79484-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 7 Jan 2025 12:17:29 -0800 SeongJae Park <sj@kernel.org> wrote:

[...]
> Extend DAMOS filters to support not only exclusion (blocking), but also
> inclusion (pass-through) behavior.
[...]
> This means that installing pass filters without block filters
> after them is not useful for some usecases.

The above comment is wrong.  The case is just useless.

> Read the design document
> update part of this patch series for more details.

I added why it is wrong in detail as a reply to the design doc patch (7/10).

I will fix the wrong parts and send this series again as v2.


Thanks,
SJ

[...]

