Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC2018089C
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2020 20:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCJT4W (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Mar 2020 15:56:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:44964 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgCJT4W (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 15:56:22 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 46EC6537;
        Tue, 10 Mar 2020 19:56:21 +0000 (UTC)
Date:   Tue, 10 Mar 2020 13:56:20 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        swood@redhat.com, mcgrof@kernel.org, keescook@chromium.org,
        yzaikin@google.com, mingo@kernel.org, kernel@gpiccoli.net
Subject: Re: [PATCH v2] Documentation: Better document the softlockup_panic
 sysctl
Message-ID: <20200310135620.27ba56f6@lwn.net>
In-Reply-To: <20200310183649.23163-1-gpiccoli@canonical.com>
References: <20200310183649.23163-1-gpiccoli@canonical.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Mar 2020 15:36:49 -0300
"Guilherme G. Piccoli" <gpiccoli@canonical.com> wrote:

> Commit 9c44bc03fff4 ("softlockup: allow panic on lockup") added the
> softlockup_panic sysctl, but didn't add information about it to the file
> Documentation/admin-guide/sysctl/kernel.rst (which in that time certainly
> wasn't rst and had other name!).
> 
> This patch just adds the respective documentation and references it from
> the corresponding entry in Documentation/admin-guide/kernel-parameters.txt.
> 
> This patch was strongly based on Scott Wood's commit d22881dc13b6
> ("Documentation: Better document the hardlockup_panic sysctl").
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Applied, thanks.

jon
