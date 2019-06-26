Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99A857162
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2019 21:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFZTM4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 15:12:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41470 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfFZTM4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jun 2019 15:12:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id g7so2774918oia.8;
        Wed, 26 Jun 2019 12:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xdmbHMmbSNut95d3F0ceTiRWRbWxom01SWzuAnwfwoI=;
        b=dtZ7IIMofqy4n/R6OQLJcCNy9vFzz/B4wjxcl4fHNYatncf8jjFaMc+lqzMIcdYYmR
         n1qUfZ6x16bxtBeFbo2rxw+rLvRA79S8GVCTmKbisT/6dVLSyxHSRKbCZ8hB5RkRnCDp
         edJYdynlh/uYetOmv+wPGg3C6ieogtKrZODKSl+RMBM/92KQbgyrwD6vx54pdvDtBnEu
         /VMdssR1n5KZ+W1s1KPmXE2vbiibNO+xPYy7rsseYLoiXY8+S7nq6rtogffcsvOkk59z
         W1tkMw2Q//B4tYE9i1Y0FUGF/7tZkfW9QMv0N7S3JZ/C9AOCZZghCl7vFXMYtlTfiIhI
         Tjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xdmbHMmbSNut95d3F0ceTiRWRbWxom01SWzuAnwfwoI=;
        b=liAZqmE200y8FJS+VMSUX4WEOWaunKlxk6+pBC7l+NDeSe3w93jFjltZ2O6uaeE8Dw
         l+fPXDoFLkNOTGTPzQc6JVy+0eP24XokTPrfRGBspj3y4bPKU+BvC84LJNl54zvJwatC
         3zyrslGLnU0MB7ZGv7GRa6xMV7qe9LmsQsplaLsc0GIYPKAZ/NCWhZ1MVb7aP63YX9uf
         A92k830nu9luQDuP8+V1Oz7fr2rb+UH3e+8LhJcArZYEJIZJLleW1LINVxL7zKZrcE75
         JvQ1aUS8i0mDwLKvJV/Z7sBEUirvnLHJh8qI4uQoS/PfGbOQHH9HLPLko6fbtp7apdRQ
         0C9w==
X-Gm-Message-State: APjAAAWyuwAmi3XguoxkxRClH0aH45aecuCF4NLYuoEFvnHWy+Tq/El3
        jFUde3yWVIuU9ocz94yX8Yc=
X-Google-Smtp-Source: APXvYqwrfJ9rAbZd5xP4Pmhc0Sl/vguk8s0s8x40qjJD++lQiYmT03onS+r4VL+sl50gZIylsItDPQ==
X-Received: by 2002:aca:d7c3:: with SMTP id o186mr396336oig.20.1561576375350;
        Wed, 26 Jun 2019 12:12:55 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id e16sm7886679oih.9.2019.06.26.12.12.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 12:12:55 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     skhan@linuxfoundation.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        rcu@vger.kernel.org, linux-doc@vger.kernel.org,
        paulmck@linux.ibm.com, josh@joshtriplett.org, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        joel@joelfernandes.org, corbet@lwn.net
Subject: [Linux-kernel-mentees][PATCH v4 4/5] Documentation: RCU: Rename txt files to rst
Date:   Wed, 26 Jun 2019 14:12:48 -0500
Message-Id: <20190626191249.21135-5-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190625062627.26378-1-c0d1n61at3@gmail.com>
References: <20190625062627.26378-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rename the following files to reST:
  - rcu.txt
  - listRCU.txt
  - UP.txt

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 Documentation/RCU/{UP.txt => UP.rst}           | 0
 Documentation/RCU/{listRCU.txt => listRCU.rst} | 0
 Documentation/RCU/{rcu.txt => rcu.rst}         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/RCU/{UP.txt => UP.rst} (100%)
 rename Documentation/RCU/{listRCU.txt => listRCU.rst} (100%)
 rename Documentation/RCU/{rcu.txt => rcu.rst} (100%)

diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.rst
similarity index 100%
rename from Documentation/RCU/UP.txt
rename to Documentation/RCU/UP.rst
diff --git a/Documentation/RCU/listRCU.txt b/Documentation/RCU/listRCU.rst
similarity index 100%
rename from Documentation/RCU/listRCU.txt
rename to Documentation/RCU/listRCU.rst
diff --git a/Documentation/RCU/rcu.txt b/Documentation/RCU/rcu.rst
similarity index 100%
rename from Documentation/RCU/rcu.txt
rename to Documentation/RCU/rcu.rst
-- 
2.22.0

