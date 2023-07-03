Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC4D74635C
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jul 2023 21:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGCTfn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jul 2023 15:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGCTfm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 15:35:42 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 604BAE62;
        Mon,  3 Jul 2023 12:35:40 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 363JZBcQ029047;
        Mon, 3 Jul 2023 21:35:11 +0200
Date:   Mon, 3 Jul 2023 21:35:11 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Kees Cook <keescook@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <ZKMi78OUCL2N5OQB@1wt.eu>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
 <202306301114.E199B136@keescook>
 <2023070213-capacity-moneybags-3668@gregkh>
 <ZKJJoK4kyOCEYcOR@1wt.eu>
 <2023070335-groggily-catfish-9ad5@gregkh>
 <202307031131.51907BC65@keescook>
 <2023070329-mangy-dipping-2ebd@gregkh>
 <202307031217.95B8803@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307031217.95B8803@keescook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 03, 2023 at 12:26:32PM -0700, Kees Cook wrote:
> I still think this version of the sentence is more readable:
> 
> However under no circumstances will patch publication be delayed for
> CVE identifier assignment.
> 
> "patch inclusion" is less clear to me that "publication", and "be
> delayed to wait for" is redundant: a delay is a wait, and "to arrive"
> is just the assignment, which is the subject of the paragraph, so better
> to keep the language for that consistent.

I agree, I find it better as well :-)

Thanks,
Willy
