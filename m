Return-Path: <linux-doc+bounces-12144-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5887C353
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 20:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68C41F22342
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 19:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBE57581E;
	Thu, 14 Mar 2024 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMrajfA9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141975817;
	Thu, 14 Mar 2024 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710443210; cv=none; b=LMrhf1TvnCRe4skG/9/cMDLw7tkpE628tWo20Q9yhot9m2Gd404vNYjlA8HuHNpW9RN5h6H2oCGgenL+E6qpXzKE/8p+i1SoNM2LJppMjbbXwj6CyzgU8beNW1/aktzopFriYCezMRGVGJ2ys0nmhdFMBjHbKgl6LckTR95doRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710443210; c=relaxed/simple;
	bh=/kHdQkq4OzkGwuYzv5B3Opu/m2md+OM/9SG0MAC9LX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LT0CTaoivRdrbv2xNPprQqW4dXoMPSHhjR6wP5KxElh+njbPYEeGsrDmYENr3N7bmgf13PWjYcBxCRcrCkCzaiveh4mh2T0Fu5v8tNLUtXcm2K0iwa7vf9BNNx1RJ4d8FilIZfwWGP8v2b4twW5DJEZDZoSAH2gpaL5kHD0u5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMrajfA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB48C433C7;
	Thu, 14 Mar 2024 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710443209;
	bh=/kHdQkq4OzkGwuYzv5B3Opu/m2md+OM/9SG0MAC9LX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jMrajfA90/K1p0xZrGsb/s7fDYT32BDLUgU258wSQNLXKWdOY9rnXDt2+BZBIda9+
	 HvchsNsUsKawokejMEZmlmaqwGq8LrEHfYpABtXmHOCh6fDxa1KnjPSdDxcSRlTvIC
	 9A7K8xH+SvIFnJVi4SMFtRzyk8ekC+6ACwykKtikI8zj/F724JUTzLPB6NOVzxIiZU
	 mHqhD9sJ9Sen3qP1RVP5TLXzOFSl0XwBQjUqDCTT55j8lvz+C+iPc6epysLs1ErByO
	 QA57SOpZ6TKvDsSUI4Cvkkc3C27neo8rJn+ibhTUHt6KoHD50P/s23MyUBdDiTgOnh
	 AGuVwTqUU5w4Q==
Date: Thu, 14 Mar 2024 12:06:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: ahmed.zaki@intel.com, aleksander.lobakin@intel.com,
 alexandre.torgue@foss.st.com, andrew@lunn.ch, corbet@lwn.net,
 davem@davemloft.net, dtatulea@nvidia.com, edumazet@google.com,
 gal@nvidia.com, hkallweit1@gmail.com, jacob.e.keller@intel.com,
 jiri@resnulli.us, joabreu@synopsys.com, justinstitt@google.com,
 kory.maincent@bootlin.com, leon@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@gmail.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org, pabeni@redhat.com,
 paul.greenwalt@intel.com, przemyslaw.kitszel@intel.com,
 rdunlap@infradead.org, richardcochran@gmail.com, saeed@kernel.org,
 tariqt@nvidia.com, vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com,
 wojciech.drewek@intel.com
Subject: Re: [PATCH RFC v2 1/6] ethtool: add interface to read Tx hardware
 timestamping statistics
Message-ID: <20240314120647.58a07d94@kernel.org>
In-Reply-To: <87jzm4vejp.fsf@nvidia.com>
References: <20240223192658.45893-1-rrameshbabu@nvidia.com>
	<20240309084440.299358-1-rrameshbabu@nvidia.com>
	<20240309084440.299358-2-rrameshbabu@nvidia.com>
	<20240312165346.14ec1941@kernel.org>
	<87v85ovj4d.fsf@nvidia.com>
	<20240314105943.7bc6f2ef@kernel.org>
	<87jzm4vejp.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Mar 2024 11:43:07 -0700 Rahul Rameshbabu wrote:
> > I don't understand.
> > Are you sure you changef the kernel to use uint, rebuilt and
> > there is no ETHTOOL_A_TS_STAT_PAD anywhere, anymore?  
> 
> Sorry, I was not as clear as I could have been with my last reply. I did
> leave ETHTOOL_A_TS_STAT_PAD in when I tested (intentionally). I was
> trying to mimic other ethtool stats implementations, but you are saying
> that in general there is no need for this padding (which I agree with)
> and I can remove that unnecessary offset. It'll be different from the
> existing stats, but I am ok with that.

Yes, the small divergence is fine - uint is pretty recent addition.

