Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F96182339
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2020 21:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731054AbgCKUUC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Mar 2020 16:20:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:53066 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731030AbgCKUUC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Mar 2020 16:20:02 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BF8A7536;
        Wed, 11 Mar 2020 20:20:01 +0000 (UTC)
Date:   Wed, 11 Mar 2020 14:20:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?572X5qWa5oiQ?= <luochucheng@vivo.com>
Cc:     =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
        tekkamanninja <tekkamanninja@gmail.com>,
        harryxiyou <harryxiyou@gmail.com>,
        mamurph <mamurph@cs.clemson.edu>,
        linux-kernel <linux-kernel@zh-kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH]Documentation/filesystems/tranlastions : translate
 debugfs.txt into Chinese
Message-ID: <20200311142000.08d47ac2@lwn.net>
In-Reply-To: <ALAAwACICO4H10tGCUblMaq2.1.1583889675079.Hmail.luochucheng@vivo.com>
References: <ALAAwACICO4H10tGCUblMaq2.1.1583889675079.Hmail.luochucheng@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 Mar 2020 09:21:15 +0800 (GMT+08:00)
罗楚成 <luochucheng@vivo.com> wrote:

> docs/zh_CN: translate Documentaion/filesystems/debugfs.txt to Chinese.
> 
> 
> Since debugfs is widely used in kernel development to help developers to debug their
> new features, it's necessary to translate it into Chinese to make debug easier for
> Chinese developers.
> 
> 
> Signed-off-by: luochucheng<luochucheng@vivo.com>

You did not read the message I sent you last time.  So I will repeat:

 - How are you generating this patch?  You should be using git
   format-patch, which should be generating a diffstat (which is missing).

 - You need to add this file to index.rst so it becomes part of the docs
   build.

 - Please put your proper name in the signed-off-by line

 - Please fix the white-space issues that wreck the code samples in your
   translated document.

Additionally, sending the patch without trivial typos (i.e. misspelled
directory names) in the changelog would be appreciated.

Thank you,

jon
