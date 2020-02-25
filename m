Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED34316EA58
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2020 16:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbgBYPpH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Feb 2020 10:45:07 -0500
Received: from ms.lwn.net ([45.79.88.28]:54992 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgBYPpH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 10:45:07 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 80F396D9;
        Tue, 25 Feb 2020 15:45:04 +0000 (UTC)
Date:   Tue, 25 Feb 2020 08:44:59 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Roger Law <shornado@gmail.com>
Cc:     tekkamanninja@gmail.com, harryxiyou@gmail.com,
        mamurph@cs.clemson.edu, linux-kernel@zh-kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH]Documentation/filesystems/tranlastions : translate
 debugfs.txt to Chinese
Message-ID: <20200225084459.5bca7d38@lwn.net>
In-Reply-To: <CANf4p2UJSFyGsv7nxYXmm0Wdkbj38BihAkcZ_+fpC-VDmEykcg@mail.gmail.com>
References: <CANf4p2UJSFyGsv7nxYXmm0Wdkbj38BihAkcZ_+fpC-VDmEykcg@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Feb 2020 22:28:16 +0800
Roger Law <shornado@gmail.com> wrote:

> From:shornado<shornado@gmail.com>
> 
> Translate Documentaion/filesystems/debugfs.txt to Chinese
> 
> signed-off-by:shornado<shornado@gmail.com>

Thank you for working to make the documentation better!

There are a few things that need to be fixed here, though, starting with
the above signoff line.  Please look at how those lines are formatted in
other patches (or in the documentation), with a capital "S" and a space
after the colon.  Please also provide your real name rather than
"shornado".

The patch has also clearly been whitespace damaged; look at the formatting
of the code samples, or even this line:

> diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.txt
> b/Documentation/translations/zh_CN/filesystems/debugfs.txt

...which should be a single line.

Could I ask you please to fix these things up?  Then email the patch to
yourself and be sure you can apply it; after that, I would be happy to see
it again.

Thanks,

jon
