Return-Path: <linux-doc+bounces-39619-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A315DA48508
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2025 17:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C703A5D3B
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2025 16:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BCB1B0438;
	Thu, 27 Feb 2025 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBeeZdWc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982851B042C;
	Thu, 27 Feb 2025 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673714; cv=none; b=qCmVaJnkvLT0YUeo3ulIh78WcKEIxPAIItxXQSbQg3IyK8sEqOs4Gl1d/Vexui0XswXgZclkxDWoIafuQ4Y6mlY00ttvHcVp6CggyZgtM8CuQ9Va5KWnIsOx0Wdwfdez5qFqgcdW7RTLBvhmvz99Va5s3NLETqFDlynC2VDH5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673714; c=relaxed/simple;
	bh=nlgrdyxvDg9Msf9RSpAvUlzdgflilHFr210SiuZW5v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7vYYaleH1bbzm8tMiNfOZWEkbSpBMvqp5i2sTciSkfp8hJwtyJ9+OQaOxJ4sAAHJFf0HyPDwNZPUeSK5UTmDT/5lPIooooQ2Afgy2YQxJG7HT2ZYywR05TCKb4MPkf8K5fiU6o1HIZkNc+s9s438bCE9hbC93UAhVvv32UUvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBeeZdWc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AABEC4CEDD;
	Thu, 27 Feb 2025 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740673714;
	bh=nlgrdyxvDg9Msf9RSpAvUlzdgflilHFr210SiuZW5v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBeeZdWcqwzeqys/WZB9/VUaFZ4fK7/I33rER38nD19stGoeus0P2r141WgZvMtuM
	 ALkiqzz471ITb79as+rXYTFps2UJpQOEDSQFGnKY6/2KEqDKKTemjc/ftta6R8Pm3j
	 orT8EtceFuFxgGRRSh8PM94vd3GTaekQ8aiegmqA5NNwFRi9m5HAYvMk8vlhKPF7NM
	 08udq7qSyCawhHT8ydhLmUhEGbehCdmT1zgKQBz4LtKTHYUi0pFUjlmI7mGYreSML6
	 mXRp4ud45pi+iRGhezWJlOOIb4NENDJjYUOekaUA8Zs+mBCkToHdbISw3qVxToWJT8
	 E0X659wToZqmQ==
Date: Thu, 27 Feb 2025 06:28:33 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: add task lifecycle summary
Message-ID: <Z8CSsWJhODjGlKF2@slm.duckdns.org>
References: <20250227155733.292672-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227155733.292672-1-arighi@nvidia.com>

On Thu, Feb 27, 2025 at 04:57:33PM +0100, Andrea Righi wrote:
> Understanding the lifecycle of a task in sched_ext can be not trivial,
> therefore add a section to the main documentation that summarizes the
> entire workflow of a task using pseudo-code.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun

