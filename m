Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF99241E2B
	for <lists+linux-doc@lfdr.de>; Tue, 11 Aug 2020 18:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgHKQWc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Aug 2020 12:22:32 -0400
Received: from ms.lwn.net ([45.79.88.28]:59204 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728947AbgHKQWc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Aug 2020 12:22:32 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AF94831A;
        Tue, 11 Aug 2020 16:22:31 +0000 (UTC)
Date:   Tue, 11 Aug 2020 10:22:30 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     trivial@kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: trace: fix a typo
Message-ID: <20200811102230.4fbe796a@lwn.net>
In-Reply-To: <87lfili2d8.fsf@bryanbrattlof.com>
References: <87lfili2d8.fsf@bryanbrattlof.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Aug 2020 16:17:12 +0000
Bryan Brattlof <hello@bryanbrattlof.com> wrote:

> emumerated -> enumerated
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  Documentation/trace/intel_th.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/intel_th.rst b/Documentation/trace/intel_th.rst
> index 70b7126eaeeb..b31818d5f6c5 100644
> --- a/Documentation/trace/intel_th.rst
> +++ b/Documentation/trace/intel_th.rst
> @@ -58,7 +58,7 @@ Bus and Subdevices
>  
>  For each Intel TH device in the system a bus of its own is
>  created and assigned an id number that reflects the order in which TH
> -devices were emumerated. All TH subdevices (devices on intel_th bus)
> +devices were enumerated. All TH subdevices (devices on intel_th bus)
>  begin with this id: 0-gth, 0-msc0, 0-msc1, 0-pti, 0-sth, which is

Applied, thanks.

jon
