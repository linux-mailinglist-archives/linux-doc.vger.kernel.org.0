Return-Path: <linux-doc+bounces-8874-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305084F97B
	for <lists+linux-doc@lfdr.de>; Fri,  9 Feb 2024 17:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4D4A1C21577
	for <lists+linux-doc@lfdr.de>; Fri,  9 Feb 2024 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D791762DC;
	Fri,  9 Feb 2024 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQXGsRDx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24846BB2F;
	Fri,  9 Feb 2024 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707495647; cv=none; b=AtvBY4psqjr0D0Hg+7Z4bVEMm9brvNFmNYt4+bFhh2HzIgdKKYDzv9Cvr9DJFCseik9MmLxg/PUtQC61axRVEfcUNwwJqH71Jsh+WXb6Wrg1ShiPqWOVfjd0OhCbHDcz3CNguPeFrXgkFOHjoMjCh5lBXVLx4hVTKP8WGV7daK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707495647; c=relaxed/simple;
	bh=FUe8AyhhPCKSa/J30DiqA+BD7KZPrczbV8a2zpDNWO0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ldcr2EtzQfrYtt4UR71ezWVwu0gxuhT4QnaqQPAO202/bR3UW/3MAx8wttBWQPhXEWJ7k3o9qqaPvErONYPURCXmXX4GHB0uB9nuRiuNP7i8ZlWW+IusaQ7S/LkgHb7mILYDbBoKN0Tvjsgp3L/JIWkmcdJKMfQsR7aYekRzJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQXGsRDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C6CC433C7;
	Fri,  9 Feb 2024 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707495647;
	bh=FUe8AyhhPCKSa/J30DiqA+BD7KZPrczbV8a2zpDNWO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GQXGsRDxpBriaidC+OgfY6oXLfYbLCdwah49E0Kj05jtSJVm5RYtTSdqnHXMQCmYm
	 nCDIq2ey1U9Mfp3oyw+dpJjsDkDbOS+uocsUf5NyfkfHH91hw4OzPhIKUr6iK3XeeR
	 4uoWjyLv0pWb4c6W0yCEnKNY03ylyvQjvFhQY4AAryNczpWORQPJpI1bHk59iyJeJI
	 NDtl4XBYNjZkV4shJsWigfR8mcheewLnn63S5b1M1JOqsd2lK0Y9xGjqbiSPaMmvqE
	 t1cJtB92UHSFex6cBPJUVISS5aZ3elPWYG1XyquA4P8S6rc8FE03tYGnbhaI4UIGof
	 ns1UAF50nUF3g==
Date: Fri, 9 Feb 2024 08:20:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: James Chapman <jchapman@katalix.com>, tparkin@katalix.com
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, edumazet@google.com,
 gnault@redhat.com, davem@davemloft.net, pabeni@redhat.com, corbet@lwn.net,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3] PPPoL2TP: Add more code snippets
Message-ID: <20240209082046.6a87f7f8@kernel.org>
In-Reply-To: <20240203223513.f2nfgaamgffz6dno@begin>
References: <20240203223513.f2nfgaamgffz6dno@begin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 3 Feb 2024 23:35:13 +0100 Samuel Thibault wrote:
> The existing documentation was not telling that one has to create a PPP
> channel and a PPP interface to get PPPoL2TP data offloading working.
> 
> Also, tunnel switching was not mentioned, so that people were thinking
> it was not supported, while it actually is.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

James, Tom, looks good?

