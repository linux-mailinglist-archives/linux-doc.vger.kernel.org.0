Return-Path: <linux-doc+bounces-936-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4817D4F7C
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 14:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE790B20EAE
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 12:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42526E0B;
	Tue, 24 Oct 2023 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLQ11kQk"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6E5CBE
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 12:09:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87AB111
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698149359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=iZkArARh9BTcR7kL2t19I65TEaHt5O6mRvItemHD3G4=;
	b=eLQ11kQkwCtGhLrPQmbgChlTK/qeGA5q7UGBQ+xmSMAbMLDlxmVxZkbMzHe7NqtA03CFsT
	zaJIZ7XujOvC69OLprCb4fk4C1YzdNoDR9XHAwnoBN0Fz7Lr7LY45j13tvWeb4MkgXGN3D
	5RnGX0JNOGDQTRdPEtPheDXUXMr/pBo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-KvQp0O3iNNKk8r5KugO8QQ-1; Tue,
 24 Oct 2023 08:09:13 -0400
X-MC-Unique: KvQp0O3iNNKk8r5KugO8QQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 096AC280605F;
	Tue, 24 Oct 2023 12:09:13 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.12])
	by smtp.corp.redhat.com (Postfix) with SMTP id 889C4492BFB;
	Tue, 24 Oct 2023 12:09:10 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 24 Oct 2023 14:08:11 +0200 (CEST)
Date: Tue, 24 Oct 2023 14:08:08 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 1/2] seqlock: fix the wrong
 read_seqbegin_or_lock/need_seqretry documentation
Message-ID: <20231024120808.GA15382@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Half of the read_seqbegin_or_lock's users are buggy (I'll send the
fixes), and I guess this is because the documentation and the pseudo
code in Documentation/locking/seqlock.rst are wrong.

Pseudo code:

	int seq = 0;
	do {
		read_seqbegin_or_lock(&foo_seqlock, &seq);

		/* ... [[read-side critical section]] ... */

	} while (need_seqretry(&foo_seqlock, seq));

read_seqbegin_or_lock() returns with the even seq, need_seqretry()
doesn't change this counter. This means that seq is always even and
thus the locking pass is simply impossible.

IOW, "_or_lock" has no effect and this code doesn't differ from

	do {
		seq = read_seqbegin(&foo_seqlock);

		/* ... [[read-side critical section]] ... */

	} while (read_seqretry(&foo_seqlock, seq));

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 Documentation/locking/seqlock.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/locking/seqlock.rst b/Documentation/locking/seqlock.rst
index bfda1a5fecad..4bdf8d4ed2a2 100644
--- a/Documentation/locking/seqlock.rst
+++ b/Documentation/locking/seqlock.rst
@@ -218,13 +218,14 @@ Read path, three categories:
    according to a passed marker. This is used to avoid lockless readers
    starvation (too much retry loops) in case of a sharp spike in write
    activity. First, a lockless read is tried (even marker passed). If
-   that trial fails (odd sequence counter is returned, which is used as
-   the next iteration marker), the lockless read is transformed to a
-   full locking read and no retry loop is necessary::
+   that trial fails (sequence counter doesn't match), make the marker
+   odd for the next iteration, the lockless read is transformed to a
+   full locking read and no retry loop is necessary, for example::
 
 	/* marker; even initialization */
-	int seq = 0;
+	int seq = 1;
 	do {
+		seq++; /* 2 on the 1st/lockless path, otherwise odd */
 		read_seqbegin_or_lock(&foo_seqlock, &seq);
 
 		/* ... [[read-side critical section]] ... */
-- 
2.25.1.362.g51ebf55



