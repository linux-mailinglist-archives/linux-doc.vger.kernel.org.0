Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CB1266845
	for <lists+linux-doc@lfdr.de>; Fri, 11 Sep 2020 20:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgIKScm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Sep 2020 14:32:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgIKScm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Sep 2020 14:32:42 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B29421D92;
        Fri, 11 Sep 2020 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599849161;
        bh=nnLh5PDA50PBANZGznYbikGGD8qINrJ/18+17ey7VJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VEuH0DiJpBqGNEt7WfWFUghkpFZqMPYZz9XwXnbI1pL9sLYCR+Ax2Ksr5OgIhqQM9
         IU2WGfChGdFBbaS2WKRMOyicVLzInTg3VKGaFL7jqPIMLP6QNpfO5UFWwF+uRfR1JJ
         yWy7FdM37dclb+I8FmeNDGZSbqg3fFQpAdk2Z+P4=
From:   Will Deacon <will@kernel.org>
To:     Pingfan Liu <kernelfans@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Geoff Levand <geoff@infradead.org>, linux-doc@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCHv2 2/2] Documentation/kvm/arm: improve description of HVC_SOFT_RESTART
Date:   Fri, 11 Sep 2020 19:32:37 +0100
Message-Id: <159984895041.2629375.6685480407417202629.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1598621998-20563-2-git-send-email-kernelfans@gmail.com>
References: <1598621998-20563-1-git-send-email-kernelfans@gmail.com> <1598621998-20563-2-git-send-email-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 28 Aug 2020 21:39:58 +0800, Pingfan Liu wrote:
> Besides disabling MMU, HVC_SOFT_RESTART also clears I+D bits. These behaviors
> are what kexec-reboot expects, so describe it more precisely.

Applied to arm64 (for-next/boot), thanks!

[1/1] Documentation/kvm/arm: improve description of HVC_SOFT_RESTART
      https://git.kernel.org/arm64/c/3a1793066fdf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
