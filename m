Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148F6241E74
	for <lists+linux-doc@lfdr.de>; Tue, 11 Aug 2020 18:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgHKQjm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Aug 2020 12:39:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:59326 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbgHKQjm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Aug 2020 12:39:42 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 75A794FA;
        Tue, 11 Aug 2020 16:39:41 +0000 (UTC)
Date:   Tue, 11 Aug 2020 10:39:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH]  Documentation/features: refresh RISC-V arch support
 files
Message-ID: <20200811103940.0a9229b9@lwn.net>
In-Reply-To: <20200810095000.32092-1-tklauser@distanz.ch>
References: <20200810095000.32092-1-tklauser@distanz.ch>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Aug 2020 11:50:00 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

> Support for these was added by the following commits:
> 
>   f2c9699f6555 ("riscv: Add STACKPROTECTOR supported")
>   3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT").
>   ed48b297fe21 ("riscv: Enable context tracking")
>   cbb3d91d3bcf ("riscv: Add kmemleak support")
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  Documentation/features/debug/kmemleak/arch-support.txt        | 2 +-
>  Documentation/features/debug/stackprotector/arch-support.txt  | 2 +-
>  Documentation/features/locking/lockdep/arch-support.txt       | 2 +-
>  Documentation/features/time/context-tracking/arch-support.txt | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
