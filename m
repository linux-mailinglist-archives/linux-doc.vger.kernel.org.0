Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1132536830
	for <lists+linux-doc@lfdr.de>; Fri, 27 May 2022 22:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354628AbiE0UpL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 May 2022 16:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350587AbiE0UpJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 May 2022 16:45:09 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471A01339E1
        for <linux-doc@vger.kernel.org>; Fri, 27 May 2022 13:45:07 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c2so5101386plh.2
        for <linux-doc@vger.kernel.org>; Fri, 27 May 2022 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+uKoFrA1MB7Px4Hceb9HtqBEm7hxyzDunzaSFZdZ65E=;
        b=JpMHO7nYYfFDaaxxq/wzIXsc4I/Z9xgwdZE0rzhnywmrdGZcUtKA/KrIyU0IeU6GnG
         6cD89RcSRO+j9Xoo1ueLijOKuYZGA2nzUwHP9WwPfga0WnX/xc0QfCNn6vNII/OoLrWD
         KIRjgDhUVv807X+e9rHfxUjNc4U8RMrb5BBBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+uKoFrA1MB7Px4Hceb9HtqBEm7hxyzDunzaSFZdZ65E=;
        b=LM2BH99g8q2xmfUFo7vmaTn21rjORbAknsTXPOZrU2ACxLQldIgWGjXOwUJONf1oIC
         Jl+xZ+7uPHQhkGMmxpkWMRgstv4KnhFFxsJK14pfzrc8CUOE4Ds+zehJDc8dZ5Jbw5Zu
         SO1fD5yB8K4BJZZfQPzkgmLRr4LBYaPiTPOiz9kVEKkQ5I6sRbNYsZFx9LeEllIBw68X
         k5i+tE/TeaL5RJOpMLRQRhPwxxgKl/UpOA6PHuodjXwpxj6Rg3hUdsoZ4uE3TVqmoDgP
         2POP12yDE6HQBPrjtDfpqJDs5/wqwjXbJq0SqyHff2Q0Br8YvgLAc1ThluXJsY44vzBd
         WTQQ==
X-Gm-Message-State: AOAM531vvR3f+zwLk2Kl5Yux/S9hyjwqYonoA0yte8Pev1hLZkHRYD5K
        HATxkAhjKsf1gpiZKwBzbBxMhQ==
X-Google-Smtp-Source: ABdhPJwQP43RMakt2LwIAl78pe4ca3GgoTmEwDTY2EZSPcZfvlKlZeVTUOXcUXS3K+fJrEcGQhpsnQ==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id oo15-20020a17090b1c8f00b001b8c6dcca61mr10068623pjb.13.1653684306778;
        Fri, 27 May 2022 13:45:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o1-20020a170902d4c100b0015e8d4eb20esm141656plg.88.2022.05.27.13.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 13:45:06 -0700 (PDT)
Date:   Fri, 27 May 2022 13:45:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     David Howells <dhowells@redhat.com>
Cc:     jlayton@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck <linux_oss@crudebyte.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Xiubo Li <xiubli@redhat.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Steve French <smfrench@gmail.com>,
        William Kucharski <william.kucharski@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
        linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-fsdevek@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] netfs: Fix gcc-12 warning by embedding vfs inode in
 netfs_i_context
Message-ID: <202205271344.75AC356A5@keescook>
References: <202205190704.1DC660E5E@keescook>
 <165296786831.3591209.12111293034669289733.stgit@warthog.procyon.org.uk>
 <3598052.1653654453@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3598052.1653654453@warthog.procyon.org.uk>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 27, 2022 at 01:27:33PM +0100, David Howells wrote:
> Hi Kees,
> 
> Is v2 good for you?  I realise I left your R-b attached to it when I posted
> it, but I can remove that if you don't have time to review it.

Oh! Yes, it's good. Since you kept the R-b, I didn't reply. It looks
good to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
