Return-Path: <linux-doc+bounces-2262-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48107EA3DD
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 20:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B21280EF0
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D420B2375F;
	Mon, 13 Nov 2023 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot1GGpWS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCF7E
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82143C433C7;
	Mon, 13 Nov 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904426;
	bh=6Ey5FD6cD8DD07OuQnycttxlCN15n2sNu8xYKDtX44k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ot1GGpWSqbRHsMZ4H0AmB0kiKmsncGDemrMZgeUANDBqxnSBsPlXtVHNLwWUVepvE
	 OGLKYHaHTW8chhxYUPnrTeL0dVPOUOLAKo4OGZtAN1GUP7+RRGploR6exNXPragTHM
	 3KSpPjzAWkqVfQQCJVwMZ8lfCOuAHOZxCo+jUm1E7kgAJo7/lJdO8/OQ7IuxhFIMNX
	 Y8Cz7wfeu02bISpUqd2zeENEg9g0yPjpyqk0oSG7C/2sH19CKNwy207VADeVb0U9yS
	 3gr4N/imrTDW8teHJTTUtxxx7envW4iJrCoAZaUZ91qC2wcqwFH2Z1rnmiZnZ+hFRi
	 HcEKzbE9rKgVg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20231028102423.179400-1-javierm@redhat.com>
References: <20231028102423.179400-1-javierm@redhat.com>
Subject: Re: [PATCH] regulator: core: Add option to prevent disabling
 unused regulators
Message-Id: <169990442285.3294075.7217773943260715696.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:22 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sat, 28 Oct 2023 12:24:03 +0200, Javier Martinez Canillas wrote:
> This may be useful for debugging and develompent purposes, when there are
> drivers that depend on regulators to be enabled but do not request them.
> 
> It is inspired from the clk_ignore_unused and pd_ignore_unused parameters,
> that are used to keep firmware-enabled clocks and power domains on even if
> these are not used by drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Add option to prevent disabling unused regulators
      commit: c986968fe92f20f2db26fa6bce27795b2e9ebe22

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


