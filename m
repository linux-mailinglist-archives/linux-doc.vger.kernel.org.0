Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE21283ACC
	for <lists+linux-doc@lfdr.de>; Mon,  5 Oct 2020 17:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgJEPh1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 5 Oct 2020 11:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgJEPhH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 11:37:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26DFC0613CE
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 08:37:07 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9935A2B7;
        Mon,  5 Oct 2020 15:37:06 +0000 (UTC)
Date:   Mon, 5 Oct 2020 09:37:04 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?R2HDq3Rhbg==?= Harter <hartergaetan@gmail.com>
Cc:     linux-doc@vger.kernel.org, federico.vaga@vaga.pv.it,
        harryxiyou@gmail.com
Subject: Re: [PATCH 1/1] docs: fix kernel-driver-statement rendering
Message-ID: <20201005093704.32dd98ec@lwn.net>
In-Reply-To: <20201005130213.74624-2-hartergaetan@gmail.com>
References: <20201005130213.74624-1-hartergaetan@gmail.com>
        <20201005130213.74624-2-hartergaetan@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  5 Oct 2020 15:02:13 +0200
Gaëtan Harter <hartergaetan@gmail.com> wrote:

> Remove the extra newline and indentation after `J. Bruce Fields` in the
> rendered html, and extra indentation in the rendered pdf.
> 
> The `J.` sequence was interpreted by sphinx as a letter ordered list
> starting at letter `J`.  It produced a sub ordered list as item of the
> main item list.
> 
>     <li><ol class="first upperalpha" start="10">
>     <li>Bruce Fields</li>
>     </ol>
>     </li>
> 
> The escaping is done before the name and not between the `J` and `.` to
> keep the name writing intact.
> 
> Signed-off-by: Gaëtan Harter <hartergaetan@gmail.com>
> ---
>  Documentation/process/kernel-driver-statement.rst               | 2 +-
>  .../translations/it_IT/process/kernel-driver-statement.rst      | 2 +-
>  .../translations/zh_CN/process/kernel-driver-statement.rst      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/kernel-driver-statement.rst b/Documentation/process/kernel-driver-statement.rst
> index a849790a68bc..3a89fec1882e 100644
> --- a/Documentation/process/kernel-driver-statement.rst
> +++ b/Documentation/process/kernel-driver-statement.rst
> @@ -67,7 +67,7 @@ today, have in the past, or will in the future.
>   - Pekka Enberg
>   - Jan Engelhardt
>   - Mark Fasheh
> - - J. Bruce Fields
> + - \ J. Bruce Fields
>   - Larry Finger

Thanks for figuring this out and explaining it so well.  This is a sad
ambiguity in the RST syntax, I guess.

In this case, though, I'm not convinced that the cure isn't worse than the
disease.  We've traded a blank line in the HTML output for some ugly
markup in the original text; I'm not sure we want to do that.

For this particular file, perhaps the best solution is just to put the
list of signatures into a literal block.  The fix for other occurrences
may be different.

Thanks,

jon
