Return-Path: <linux-doc+bounces-5840-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB881CF4E
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 21:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C79041F242D0
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 20:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEE41DDD7;
	Fri, 22 Dec 2023 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxBtVClU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A411DDC7;
	Fri, 22 Dec 2023 20:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F214EC433C8;
	Fri, 22 Dec 2023 20:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703277342;
	bh=iXKYtqMzVuHtlxTF0qfLDk0CULUFNn1jMRPwGx0uC14=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dxBtVClU5CP6vF/PlVc04A9fZ3uEaCZ+yVqtibwuvN/j24xSM6R8aaXp0dORQ9wMG
	 mN4rldr7PAt+zRsrymf88EQ2Ry7sM3qf7hNDfknc7aE9F95reGLs9vsu+wIlo4j3yK
	 kt/iu8UW/L//tMin+vg38QqJlYkyl1s0+rpW42JfaxpNfa2zzTH2TrL+HgLbXLkd+N
	 vLpSm7fqbhbSpkXHo1ZDR4OSfkSpJQmgj1Te5x9WXdGYpFbqvFb+FPwB6yn6/qNP50
	 5KbsaYsaZ0EavRznf3f2sCgvTnupcr25mDX4eYgsiZlXzKW3TXICquKON5fU5SqmEr
	 eOubaekmX2iyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2F8DDD4EE0;
	Fri, 22 Dec 2023 20:35:41 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mpdesouza@suse.com, borntraeger@linux.ibm.com, shuah@kernel.org, 
 linux-doc@vger.kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
 live-patching@vger.kernel.org, mbenes@suse.cz, bugs@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, svens@linux.ibm.com, 
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 agordeev@linux.ibm.com, pmladek@suse.com, gor@linux.ibm.com, 
 hca@linux.ibm.com, jikos@kernel.org, corbet@lwn.net
Message-ID: <20231222-b218303-d272473600e9@bugzilla.kernel.org>
In-Reply-To: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
Subject: Re: livepatch: Move modules to selftests and add a new test
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 22 Dec 2023 20:35:41 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218303

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


