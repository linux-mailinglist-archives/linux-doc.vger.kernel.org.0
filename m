Return-Path: <linux-doc+bounces-34414-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88929A063AA
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 18:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D333188895A
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 17:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E5C1FE450;
	Wed,  8 Jan 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZ6cpumv"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EA01A23B8;
	Wed,  8 Jan 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358449; cv=none; b=h6sU7MDDVTbvjXP/Xb55uXbCODYSJDX67xpACS8kxRJ17B6UCaIyM5vUWAZIzmDvJGTyY1RBWidnhOMmCESBihi+PEdX7zWNFsUI78DLjY6iGZeWzeLmvJOSbFpha6Vtkoyd/ZoL7pFIi/1MCUv33nmBIOkU4HxmwecIkauLNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358449; c=relaxed/simple;
	bh=8ZfYycODbrfNGifGkkPoz16cKw1AZYtJuPX4kcsGeHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQeHx3Ft7S9pwm1LK2zZJsvmArNviEHPPMSv8zHItEVq42ES+Uo1JZHcM2Gc2FaH+1maiiysFoRb9x+x2xaw9CCcANJJZzcCKi+0W7aBy3zAWvGPK9JDcRwVZY3HIjWBySaP+yYPih+2M9MVnQHnP6LFYNEgllB9M0yfTGgHNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZ6cpumv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817DC4CEDF;
	Wed,  8 Jan 2025 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736358448;
	bh=8ZfYycODbrfNGifGkkPoz16cKw1AZYtJuPX4kcsGeHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OZ6cpumvCMw9rw8VirufHBaEHEwl+jVLwsmZTAZGjthQJjDEL1efIlnjhz/gbv4RN
	 4fg8OL9fMP6Fh3p9ckqha1Xhbj5zcoYyCiS2KS5+ndPq0tPf/LRHbo9kmUiwDMQ9fn
	 UF9x8cs1fKZz91n9LriSx5+UYVbJIol9Boa/tPp/pE4Z28ab/OyR10hsUyFC0YGQob
	 MDQzUrpbdHmIVNcs/ByKOS4AttI2f5FN0SYyNE3GLLK3UsoeKMijbFYaCEmhMHdnsh
	 YwhRFzldWUqwm0sW3Ly8JUsmw9Ly/FBUdFEJ7zJTZfhM7rVlVEfmk6p3/iroT70a1z
	 2+PrU25mcMI7g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250108141045.1032-1-rf@opensource.cirrus.com>
References: <20250108141045.1032-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: doc: cs35l56: Add information about Cirrus Logic
 CS35L54/56/57
Message-Id: <173635844756.103652.16150764229479755990.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 17:47:27 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 08 Jan 2025 14:10:45 +0000, Richard Fitzgerald wrote:
> Add documentation for the Cirrus Logic CS35L54/56/57 amps, which are
> all managed by the cs35l56 drivers.
> 
> The aim and scope of this documentation is to provide troubleshooting
> information for end-users.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57
      commit: 088fb4ee17fc456fcbce0a9ff46d147e3b2be139

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


