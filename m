Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE8F174E58
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2020 17:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgCAQUK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 Mar 2020 11:20:10 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36531 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgCAQUK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Mar 2020 11:20:10 -0500
Received: by mail-pf1-f194.google.com with SMTP id i13so4326436pfe.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2020 08:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ol996i7Ly7uLXMGPOcxJk9a2/P7UfTmFHb83woUuOo4=;
        b=BmBgW1BXpb61N9UVhWc3UCobtjZmRY8cfjAit8K3GJNut56umMykryyzI9AzxVCNPu
         zOEVDsY3sT4UDzTHMxTNl9cA7M9jDoCm9XTPeWxZcTzpfVvX/4GlQyjehDQw0YtTjoWL
         EB9DXjWAslee7XYEPpiMDSk/CpSA8B7PG1YgEGGc+U8RJWtG64RB7rrOGqzA7b4rQS5s
         omthZP5UEN5t/YqPCx4Z7BD6vT2yjRFsX2lYXKeIaPmSzb2BFnmgmLEeGuprZ4xHPtlk
         MsDaZbTpDj609q6Y8zXZ0uP9KGKGRdg1t2ky59PPhmZPGZJqesifD/zmyl5NnA3qyDyZ
         FcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ol996i7Ly7uLXMGPOcxJk9a2/P7UfTmFHb83woUuOo4=;
        b=hNSnniFGqE/JBfAPztvc7r1k99MgNPr4Y0his6FfD6ybubrndO6lCgI7aY8VuL3y8S
         kVOIew3wgmUlQUTUTtVkUvZrK9F0wIjqFIQ23pGD+YN8Q+msFWctOFZdRlcw9tQfe1N5
         65cuYllz5PVzX8rQAunpjErOLECdWUEjVvWs1uR203Ohnp94qXr62m6eEhjMDXVryP+q
         8kBI722T6nDqemc+DMqJzrdPZndpeQ077UNxE6YbpFy75W9pSra9DdTRz0rn9HXem/ks
         lZehMpp7HzDjDxKs0uP9aJxnHzLzUow8qGOV3/GGYEPv7t6aJa8cfyB7Pnl9hwnDAab/
         6iOg==
X-Gm-Message-State: APjAAAU04uyjJWZCSxMF1uCCae47C3CsCBWCm71Bdcv8I47cTjoAKdm7
        AYt9Kx1VgtLWOEm+wLNDL6b+cw==
X-Google-Smtp-Source: APXvYqybwsty6KbQzUZw6ydXZynsFTmZ7U2b15x7Sf8aB1XCoBDm81Hv5r+UKknAcAJrYKKAt382gA==
X-Received: by 2002:a65:6147:: with SMTP id o7mr15882420pgv.442.1583079609158;
        Sun, 01 Mar 2020 08:20:09 -0800 (PST)
Received: from google.com ([2620:15c:211:202:ae26:61fb:e2f3:92e7])
        by smtp.gmail.com with ESMTPSA id e2sm9004532pjs.25.2020.03.01.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 08:20:08 -0800 (PST)
Date:   Sun, 1 Mar 2020 08:20:03 -0800
From:   Marco Ballesio <balejs@google.com>
To:     Roman Gushchin <guro@fb.com>
Cc:     tj@kernel.org, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, lizefan@huawei.com,
        hannes@cmpxchg.org, corbet@lwn.net, rjw@rjwysocki.net,
        pavel@ucw.cz, len.brown@intel.com, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, minchan@google.com, surenb@google.com,
        dancol@google.com
Subject: Re: [PATCH] cgroup-v1: freezer: optionally killable freezer
Message-ID: <20200301162003.GA186618@google.com>
References: <20200219183231.50985-1-balejs@google.com>
 <20200229005131.GB9813@google.com>
 <20200229184300.GA484762@carbon.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200229184300.GA484762@carbon.DHCP.thefacebook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 29, 2020 at 10:43:00AM -0800, Roman Gushchin wrote:
> On Fri, Feb 28, 2020 at 04:51:31PM -0800, Marco Ballesio wrote:
> > Hi all,
> > 
> > did anyone have time to look into my proposal and, in case, are there
> > any suggestions, ideas or comments about it?
> 
> Hello, Marco!
> 
> I'm sorry, somehow I missed the original letter.
> 
> In general the cgroup v1 interface is considered frozen. Are there any particular
> reasons why you want to extend the v1 freezer rather than use the v2 version of it?
> 
> You don't even need to fully convert to cgroup v2 in order to do it, some v1
> controllers can still be used.
> 
> Thanks!
> 
> Roman

Hi Roman,

When compared with backports of v2 features and their dependency chains, this
patch would be easier to carry in Android common. The potential is to have
killability for frozen processes on hw currently in use.

Marco
