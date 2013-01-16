// Default empty project template
#ifndef MTMediaPlayer_HPP_
#define MTMediaPlayer_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class MTMediaPlayer : public QObject
{
    Q_OBJECT
public:
    MTMediaPlayer(bb::cascades::Application *app);
    virtual ~MTMediaPlayer() {}
};


#endif /* MTMediaPlayer_HPP_ */
