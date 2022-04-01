Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C784EE81C
	for <lists+linux-doc@lfdr.de>; Fri,  1 Apr 2022 08:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbiDAGVY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Apr 2022 02:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiDAGVY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 02:21:24 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0D512F157;
        Thu, 31 Mar 2022 23:19:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0D9A7CE2402;
        Fri,  1 Apr 2022 06:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CC5C340EE;
        Fri,  1 Apr 2022 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648793972;
        bh=UNO2VY2szv3tnY2SSi44aAJ9/bbdp19Fi5sMykNkswE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCHiplod743wmDADlym8FzwvFReEK1+BjoT6lMvXmE87rEM0nZFG4Tz9I7BzUNlGD
         Q9oWAYymPkNL5IP7WKoTMSERvTZjLP41m+gQB1J5VZ7qey10gG/MJCnedYqM4ubey7
         0quqtvVpnGcS7tEddZVn5qkvi2vFtC8DQ8K/3mv8=
Date:   Fri, 1 Apr 2022 08:19:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Vacura <w36195@motorola.com>
Cc:     linux-usb@vger.kernel.org, stable@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Carlos Bilbao <bilbao@vt.edu>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: allow changing interface name via
 configfs
Message-ID: <YkaZcSsadjHp1yJZ@kroah.com>
References: <20220331211155.412906-1-w36195@motorola.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331211155.412906-1-w36195@motorola.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 31, 2022 at 04:11:50PM -0500, Dan Vacura wrote:
> Add a configfs entry, "function_name", to change the iInterface field
> for VideoControl. This name is used on host devices for user selection,
> useful when multiple cameras are present. The default will remain "UVC
> Camera".
> 
> Cc: <stable@vger.kernel.org> # 5.10+

Why is adding a new feature a stable kernel issue?

confused,

greg k-h
